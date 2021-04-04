function [NonLoad,NonCen_W] = PostProcess(Load,DeflectionFactor,LoadFactor,nx,ny,mx,my,nnode,ndof,sdof,Lambda,Disp)

Nodes = reshape(1:nnode,my,mx);
LeftBottomNode = Nodes(1,1);
LeftMiddleNode = Nodes(ny+1,1);
LeftTopNode = Nodes(2*ny+1,1);
BottomNode = Nodes(1,nx+1);
MiddleNode = Nodes(ny+1,nx+1);
TopNode = Nodes(2*ny+1,nx+1);
RightBottomNode  = Nodes(1,2*nx+1);
RightMiddleNode  = Nodes(ny+1,2*nx+1);
RightTopNode  = Nodes(2*ny+1,2*nx+1);


CentralDeflection = Disp(MiddleNode*ndof-(ndof-3));
NonLoad = Lambda*Load*LoadFactor;
NonCen_W = CentralDeflection*DeflectionFactor;


end

