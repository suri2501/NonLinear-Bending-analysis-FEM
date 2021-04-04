function [tangent,stiffness,force] = TSDT_5dof(Parameter,Load,Lx,Ly,h,...
    nel,nnel,ndof,nnode,edof,sdof,Coordinate,IEN,...
    B1Matrix,B2Matrix,B3Matrix,B4Matrix,...
    S1Matrix,S2Matrix,S3Matrix,S4Matrix,displacement)

%--------------------------------------------------------------------------
% Order of Gauss Quadrature
%--------------------------------------------------------------------------
%  For bending stiffness
nglb = 3;               % Full Gauss-Legendre quadrature for bending 
[pointb,weightb]=GaussQuadrature(nglb);     % sampling points & weights

%  For shear stiffness
ngls = 3;                 % Reduced Gauss-Legendre quadrature for shear 
[points,weights] = GaussQuadrature(ngls);   % sampling points & weights

%--------------------------------------------------------------------------
% Initialization of matrices and vectors
%--------------------------------------------------------------------------
tangent = zeros(sdof);              % system tangent stiffness matrix
stiffness = zeros(sdof);              % system stiffness matrix
force = zeros(sdof,1);              % System Force Vector

for iel=1:nel                       % loop for the total number of elements

tSigmab_e = zeros(edof,edof);      % initialization of initial stress matrix
kLLb_e = zeros(edof,edof);       % initialization of linear bending matrix
kLNLb_e = zeros(edof,edof);
kNLLb_e = zeros(edof,edof);
kNLNLb_e = zeros(edof,edof);

tSigmas_e = zeros(edof,edof);
kLLs_e = zeros(edof,edof);       % initialization of linear shear matrix
kLNLs_e = zeros(edof,edof);
kNLLs_e = zeros(edof,edof);
kNLNLs_e = zeros(edof,edof);

kp_e = zeros(edof,edof);

fm_e = zeros(edof,1);                 % initialization of force vector
% keyboard
IEN_e = IEN(iel,:);
x_e = Coordinate(IEN_e,1)';
y_e = Coordinate(IEN_e,2)';

u_e = displacement(IEN_e*ndof-(ndof-1))';
v_e = displacement(IEN_e*ndof-(ndof-2))';
w_e = displacement(IEN_e*ndof-(ndof-3))';
phix_e = displacement(IEN_e*ndof-(ndof-4))';
phiy_e = displacement(IEN_e*ndof-(ndof-5))';
thetax_e = displacement(IEN_e*ndof-(ndof-6))';
thetay_e = displacement(IEN_e*ndof-(ndof-7))';

%--------------------------------------------------------------------------
%  Numerical integration for bending term
%--------------------------------------------------------------------------
for intx=1:nglb
xi=pointb(intx,1);                     % sampling point in x-axis
wtx=weightb(intx,1);                   % weight in x-axis
for inty=1:nglb
eta=pointb(inty,2);                    % sampling point in y-axis
wty=weightb(inty,2) ;                  % weight in y-axis
% keyboard
% Compute Shape Function
[R,dRdxi,dRdeta] = ShapeFunctionQ9(xi,eta);
% compute Jacobian
[detJ22,invJ22] = Jacobian(dRdxi,dRdeta,x_e,y_e);
% derivatives w.r.t. physical coordinate
[dRdx,dRdy] = ShapefunctionDerivatives(dRdxi,dRdeta,invJ22);

%--------------------------------------------------------------------------
%  compute bending element matrix
%--------------------------------------------------------------------------
% linear bending kinematic matrix
BLb = LinearBending(ndof,nnel,B1Matrix,dRdx,dRdy);
kLLb_e = kLLb_e + BLb'*B1Matrix*BLb*wtx*wty*detJ22;

% % non-linear bending kinematic matrix
% [Ab,Gb] = NonLinearBending(ndof,nnel,dRdx,dRdy,u_e,v_e,w_e,phix_e,phiy_e,thetax_e,thetay_e);
% if strcmp(Parameter.Type,'Linear')
%     Gb(:,:) = 0;
% end
% if strcmp(Parameter.Type,'vonKarman')
%     Gb([1:4,7:end],:) = 0;
% end
% BNLb = Ab*Gb;

% kLNLb_e = kLNLb_e + BLb'*B2Matrix*BNLb*wtx*wty*detJ22;
% kNLLb_e = kNLLb_e + BNLb'*B3Matrix*BLb*wtx*wty*detJ22;
% kNLNLb_e = kNLNLb_e + BNLb'*B4Matrix*BNLb*wtx*wty*detJ22;

% Sb = InitialStressb_e(Parameter,ndof,nnel,R,dRdx,dRdy,...
%     B1Matrix,B2Matrix,B3Matrix,B4Matrix,u_e,v_e,w_e,phix_e,phiy_e,thetax_e,thetay_e);
% tSigmab_e = tSigmab_e + Gb'*Sb*Gb*wtx*wty*detJ22;


%--------------------------------------------------------------------------
% compute force element vector
%--------------------------------------------------------------------------
if strcmp(Parameter.Load,'SSL')
    fm_e = fm_e + Load*wtx*wty*detJ22*Force(ndof,nnel,R)*cos(pi/Lx*(x_e*R))*cos(pi/Ly*(y_e*R));
elseif strcmp(Parameter.Load,'UDL')
    fm_e = fm_e + Load*wtx*wty*detJ22*Force(ndof,nnel,R);
else
    error('Spartial Load is wrong\n');
end

end
end     % end of numerical integration loop for bending term

%--------------------------------------------------------------------------
%  numerical integration for shear term
%--------------------------------------------------------------------------
for intx=1:ngls
xi=points(intx,1);                           % sampling point in x-axis
wtx=weights(intx,1);                         % weight in x-axis
for inty=1:ngls
eta=points(inty,2);                          % sampling point in y-axis
wty=weights(inty,2) ;                        % weight in y-axis

% Compute Shape Function
[R,dRdxi,dRdeta] = ShapeFunctionQ9(xi,eta);
% compute Jacobian
[detJ22,invJ22] = Jacobian(dRdxi,dRdeta,x_e,y_e);
% derivatives w.r.t. physical coordinate
[dRdx,dRdy] = ShapefunctionDerivatives(dRdxi,dRdeta,invJ22);

%%
%--------------------------------------------------------------------------
%  compute non-linear bending element matrix
%--------------------------------------------------------------------------
% linear bending kinematic matrix
BLb = LinearBending(ndof,nnel,B1Matrix,dRdx,dRdy);
% non-linear bending kinematic matrix
[Ab,Gb] = NonLinearBending(ndof,nnel,dRdx,dRdy,u_e,v_e,w_e,phix_e,phiy_e,thetax_e,thetay_e);
if strcmp(Parameter.Type,'Linear')
    Gb(:,:) = 0;
end
if strcmp(Parameter.Type,'vonKarman')
    Gb([1:4,7:end],:) = 0;
end
BNLb = Ab*Gb;

kLNLb_e = kLNLb_e + BLb'*B2Matrix*BNLb*wtx*wty*detJ22;
kNLLb_e = kNLLb_e + BNLb'*B3Matrix*BLb*wtx*wty*detJ22;
kNLNLb_e = kNLNLb_e + BNLb'*B4Matrix*BNLb*wtx*wty*detJ22;

%--------------------------------------------------------------------------
%  compute initial stress tanget element matrix
%--------------------------------------------------------------------------
% non-linear initial inplane stress matrix
Sb = InitialStressb_e(Parameter,ndof,nnel,R,dRdx,dRdy,...
    B1Matrix,B2Matrix,B3Matrix,B4Matrix,u_e,v_e,w_e,phix_e,phiy_e,thetax_e,thetay_e);
tSigmab_e = tSigmab_e + Gb'*Sb*Gb*wtx*wty*detJ22;

%%
%--------------------------------------------------------------------------
%  compute linear and non-linear shear element matrix
%--------------------------------------------------------------------------
% Linear shear kinematic matrix
BLs = LinearShear(ndof,nnel,S1Matrix,R,dRdx,dRdy);     % shear kinematic matrix
% non-linear shear kinematic matrix
[As,Gs] = NonLinearShear(ndof,nnel,R,dRdx,dRdy,u_e,v_e,w_e,phix_e,phiy_e,thetax_e,thetay_e);
if strcmp(Parameter.Type,'Linear')
    Gs(:,:) = 0;
end
if strcmp(Parameter.Type,'vonKarman')
    Gs(:,:) = 0;
end
BNLs = As*Gs;
kLLs_e = kLLs_e + BLs'*S1Matrix*BLs*wtx*wty*detJ22;
kLNLs_e = kLNLs_e + BLs'*S2Matrix*BNLs*wtx*wty*detJ22;
kNLLs_e = kNLLs_e + BNLs'*S3Matrix*BLs*wtx*wty*detJ22;
kNLNLs_e = kNLNLs_e + BNLs'*S4Matrix*BNLs*wtx*wty*detJ22;

%--------------------------------------------------------------------------
%  compute initial stress tanget element matrix
%--------------------------------------------------------------------------
% non-linear initial shear stress matrix
Ss = InitialStresss_e(ndof,nnel,R,dRdx,dRdy,...
    S1Matrix,S2Matrix,S3Matrix,S4Matrix,u_e,v_e,w_e,phix_e,phiy_e,thetax_e,thetay_e);
tSigmas_e = tSigmas_e + Gs'*Ss*Gs*wtx*wty*detJ22;

%%
%--------------------------------------------------------------------------
% compute penalty stiffness matrix
%--------------------------------------------------------------------------
gamma = Parameter.gamma; 
[Px,Py] = PenaltyStiffness(ndof,nnel,R,dRdx,dRdy);
kp_e = kp_e + gamma*(Px'*Px+Py'*Py)*wtx*wty*detJ22*h;

end
end     % end of numerical integration loop for shear term
% keyboard
%--------------------------------------------------------------------------
%  compute element matrix and vector
%--------------------------------------------------------------------------
if strcmp(Parameter.Type,'Linear')
    NL = 0;
else
    NL = 1;
end
te = kp_e +...
    kLLb_e + (kLNLb_e + kNLLb_e  + kNLNLb_e + tSigmab_e)*NL +...
    kLLs_e + (kLNLs_e + kNLLs_e + kNLNLs_e + tSigmas_e)*NL;
ke = kp_e +...
    kLLb_e + (0.5*kLNLb_e + kNLLb_e  + 0.5*kNLNLb_e)*NL +...
    kLLs_e + (0.5*kLNLs_e + kNLLs_e + 0.5*kNLNLs_e)*NL;
fe = fm_e;

%--------------------------------------------------------------------------
% Assemble
%-------------------------------------------------------------------------- 
[tangent,stiffness,force] = Assemble(...
    tangent,te,stiffness,ke,force,fe,IEN_e,ndof);
end

end