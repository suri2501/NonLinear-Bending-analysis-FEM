function [SprStress] = SuperConvergantPatch(nx,ny,Qbar,IndexZ,IEN,Coordinate,displacement,funF,fundF,Parameter)

SprStress = zeros(length(Coordinate),5);
SprCount = zeros(size(SprStress,1),1);

nel = size(IEN,1);                     % Number of elements
nnel = size(IEN,2);                    % Number of nodes per element
ndof = 7;                              % Number of dofs per node (u0,v0,w0,thetax,thetay)
nnode = length(Coordinate);            % Total Number of nodes in system

edof=nnel*ndof;                        % degrees of freedom per element

IEP = zeros((ny-1)*(nx-1),4);
ElementMesh = reshape(1:nel,ny,nx);
PatchIndex = 1;
for iP=1:nx-1
for jP=1:ny-1
	TempPatch = ElementMesh(jP:jP+1,iP:iP+1);
	IEP(PatchIndex,:) = TempPatch(:)';
	PatchIndex = PatchIndex + 1;
end
end
npa = size(IEP,1);  % Number of Patch

% Material property
Qbarp = Qbar(1:3,1:3);
Qbars = Qbar(4:5,4:5);

% Strain transformation matrix
ZL_b = [eye(3),eye(3)*IndexZ,eye(3)*funF(IndexZ)];
ZNL_b = [eye(3),eye(3)*IndexZ,eye(3)*funF(IndexZ),eye(3)*IndexZ^2,eye(3)*IndexZ*funF(IndexZ),eye(3)*funF(IndexZ)^2];
ZL_s = [eye(2),eye(2)*fundF(IndexZ)];
ZNL_s = [eye(2),eye(2)*IndexZ,eye(2)*funF(IndexZ),eye(2)*fundF(IndexZ),eye(2)*IndexZ*fundF(IndexZ),eye(2)*funF(IndexZ)*fundF(IndexZ)];

%--------------------------------------------------------------------------
% Order of Gauss Quadrature
%--------------------------------------------------------------------------
%  For inplane stress
ngls = 2;       % Reduced Gauss-Legendre quadrature for inplane stresses 
[points,weights] = GaussQuadrature(ngls); % sampling points & weights

NodeMesh = reshape(1:nnode,2*ny+1,2*nx+1);
ConstraintNode = unique(sort([NodeMesh(:,1);NodeMesh(:,end);NodeMesh(1,:)';NodeMesh(end,:)']));

for i_p = 1:npa
    Mass_p = zeros(9); % 9 Depend upon polnomial variable
    Force_p = zeros(9,5); % 3 for inplane stress
    
	NodeMesh_p = zeros(5);  % Node Mesh : 4 Element Patch
	NodeMesh_p(1:3,1:3) = reshape(IEN(IEP(i_p,1),:),3,3);
	NodeMesh_p(3:5,1:3) = reshape(IEN(IEP(i_p,2),:),3,3);
	NodeMesh_p(1:3,3:5) = reshape(IEN(IEP(i_p,3),:),3,3);
	NodeMesh_p(3:5,3:5) = reshape(IEN(IEP(i_p,4),:),3,3);

    % Extraction of Coordinates
    x_p = Coordinate(NodeMesh_p(:),1);
    y_p = Coordinate(NodeMesh_p(:),2);

    % Vertex Node
    Node_v = NodeMesh_p(3,3);
	x_v = Coordinate(Node_v,1);
	y_v = Coordinate(Node_v,2);
        
	for iElement_p = 1:size(IEP,2)
        IEN_e = IEN(IEP(i_p,iElement_p),:);
        x_e = Coordinate(IEN_e,1)';
        y_e = Coordinate(IEN_e,2)';
        
        % Extract system dofs associated with element
        index = [IEN_e*ndof-6; IEN_e*ndof-5; IEN_e*ndof-4; IEN_e*ndof-3; IEN_e*ndof-2; IEN_e*ndof-1; IEN_e*ndof];
        index = index(:)';
        displacement_e = displacement(index);

        % Extract element displacement vector
        u_e = displacement(IEN_e*ndof-(ndof-1))';
        v_e = displacement(IEN_e*ndof-(ndof-2))';
        w_e = displacement(IEN_e*ndof-(ndof-3))';
        phix_e = displacement(IEN_e*ndof-(ndof-4))';
        phiy_e = displacement(IEN_e*ndof-(ndof-5))';
        thetax_e = displacement(IEN_e*ndof-(ndof-6))';
        thetay_e = displacement(IEN_e*ndof-(ndof-7))';
        
        
        for intx=1:ngls
        xi = points(intx,1);                   % sampling point in x-axis
        wtx = weights(intx,1);
        for inty=1:ngls
        eta = points(inty,2);                  % sampling point in y-axis
        wty = weights(intx,2);

        % compute shape functions and derivatives at sampling point
        [R,dRdxi,dRdeta] = ShapeFunctionQ9(xi,eta);
        % compute Jacobian
        [detJ22,invJ22] = Jacobian(dRdxi,dRdeta,x_e,y_e);
        % derivatives w.r.t. physical coordinate
        [dRdx,dRdy] = ShapefunctionDerivatives(dRdxi,dRdeta,invJ22);
        
        % linear kinematic matrix
        BLb = LinearBending(ndof,nnel,ZL_b,dRdx,dRdy);
        BLs = LinearShear(ndof,nnel,ZL_s,R,dRdx,dRdy);
        
        % nonlinear kinematics matrix
        [Ab,Gb] = NonLinearBending(ndof,nnel,dRdx,dRdy,u_e,v_e,w_e,phix_e,phiy_e,thetax_e,thetay_e);
        if strcmp(Parameter.Type,'Linear')
            Gb(:,:) = 0;
        end
        if strcmp(Parameter.Type,'vonKarman')
            Gb([1:4,7:end],:) = 0;
        end
        BNLb = Ab*Gb;
        [As,Gs] = NonLinearShear(ndof,nnel,R,dRdx,dRdy,u_e,v_e,w_e,phix_e,phiy_e,thetax_e,thetay_e);
        if strcmp(Parameter.Type,'Linear')
            Gs(:,:) = 0;
        end
        if strcmp(Parameter.Type,'vonKarman')
            Gs(:,:) = 0;
        end
        BNLs = As*Gs;

        % Coordinate at Guass Point
        xGP = x_e*R;
        yGP = y_e*R;
        
        % Method : 1
%         xBar = xGP;
%         yBar = yGP;
        % Method : 2
        xBar = xGP-x_v;
        yBar = yGP-y_v;
        % Method : 3
%         xBar = -1+2*((xGP-min(x_p))/(max(x_p)-min(x_p)));
%         yBar = -1+2*((yGP-min(y_p))/(max(y_p)-min(y_p)));

        % For 9 Noded Quadilateral Element
        P = [1,xBar,yBar,xBar.*yBar,xBar.^2,yBar.^2,xBar.^2.*yBar,xBar.*yBar.^2,xBar.^2.*yBar.^2];
        
        % Mass Matrix
        Mass_p = Mass_p + P'*P;
        
        if strcmp(Parameter.Type,'Linear')
            NL = 0;
        else
            NL = 1;
        end
        
        % Compute Stress
        SigmaGP = Qbarp*(ZL_b*BLb*displacement_e + NL*0.5*ZNL_b*BNLb*displacement_e);
        TauGP = Qbars*(ZL_s*BLs*displacement_e + NL*0.5*ZNL_s*BNLs*displacement_e);
        % Force Vector
        Force_p = Force_p + P'*[SigmaGP',TauGP'];
        
        end
        end
	end

	% Solution
	Coefficient = Mass_p\Force_p;
	%%
    %----------------------------------------------------------------------
    % Calculation of Stresses at Nodes
    %----------------------------------------------------------------------
    % Internal Node of Patch
	InternalNode_p = reshape(NodeMesh_p(2:end-1,2:end-1),[],1);
   
	for iINp = 1:numel(InternalNode_p)
        node_p = InternalNode_p(iINp);
        xNode = Coordinate(node_p,1);
        yNode = Coordinate(node_p,2);

        % Method : 1
%         xBar = xNode;
%         yBar = yNode;
        % Method : 2
        xBar = xNode - x_v;
        yBar = yNode - y_v;
        % Method : 3
%         xBar = -1+2*((xNode-min(x_p))/(max(x_p)-min(x_p)));
%         yBar = -1+2*((yNode-min(y_p))/(max(y_p)-min(y_p)));
        
        % For 9 Noded Quadilateral Element
        P = [1,xBar,yBar,xBar.*yBar,xBar.^2,yBar.^2,xBar.^2.*yBar,xBar.*yBar.^2,xBar.^2.*yBar.^2];
        SprStress(node_p,:) =  SprStress(node_p,:) +  P*Coefficient;

        SprCount(node_p) = SprCount(node_p) + 1;   
	end
    %%
    % Boundary Node of Patch
    BoundaryNode_p = [];
    EdgeNode_p = unique(sort([NodeMesh_p(:,1);NodeMesh_p(:,end);...
        NodeMesh_p(1,:)';NodeMesh_p(end,:)';]));
    for iENp = 1:length(EdgeNode_p)
        if find(ConstraintNode==EdgeNode_p(iENp))>0
        BoundaryNode_p = [BoundaryNode_p; EdgeNode_p(iENp);];
        end
    end
    
    for iBN_p=1:length(BoundaryNode_p)
        node_p = BoundaryNode_p(iBN_p);
        xNode = Coordinate(node_p,1);
        yNode = Coordinate(node_p,2);

        % Method : 1
%         xBar = xNode;
%         yBar = yNode;
        % Method : 2
        xBar = xNode - x_v;
        yBar = yNode - y_v;
        % Method : 3
%         xBar = -1+2*((xNode-min(x_p))/(max(x_p)-min(x_p)));
%         yBar = -1+2*((yNode-min(y_p))/(max(y_p)-min(y_p)));
        
        % For 9 Noded Quadilateral Element
        P = [1,xBar,yBar,xBar.*yBar,xBar.^2,yBar.^2,xBar.^2.*yBar,xBar.*yBar.^2,xBar.^2.*yBar.^2];
        SprStress(node_p,:) =  SprStress(node_p,:) +  P*Coefficient;

        SprCount(node_p) = SprCount(node_p) + 1;  
    end
end

for icoordinate = 1:length(Coordinate)
    if SprCount(icoordinate)~=0
    SprStress(icoordinate,:) = SprStress(icoordinate,:)/SprCount(icoordinate);
    end
end

end