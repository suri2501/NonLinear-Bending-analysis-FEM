function [Coordinate,IEN] = Mesh(Lx,Ly,mx,my,nnode)

% Discretizing the Length and Breadth of the plate
divisionx = linspace(-Lx/2,Lx/2,mx);
divisiony = linspace(-Ly/2,Ly/2,my);
% divisionx = linspace(0,Lx,mx);
% divisiony = linspace(0,Ly,my);
[xx,yy] = meshgrid(divisionx,divisiony);
Coordinate = [xx(:) yy(:)];

%%
Nodes = reshape(1:nnode,my,mx);
node1 = Nodes(1:2:end-1,1:2:end-1);
node2 = Nodes(2:2:end,1:2:end-1);
node3 = Nodes(3:2:end,1:2:end-1);

node4 = Nodes(1:2:end-1,2:2:end);
node5 = Nodes(2:2:end,2:2:end);
node6 = Nodes(3:2:end,2:2:end);

node7 = Nodes(1:2:end-1,3:2:end);
node8 = Nodes(2:2:end,3:2:end);
node9 = Nodes(3:2:end,3:2:end);
IEN = [node1(:) node2(:) node3(:) node4(:)...
    node5(:) node6(:) node7(:) node8(:) node9(:)];

end