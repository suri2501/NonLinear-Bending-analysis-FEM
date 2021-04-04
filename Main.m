% C0 Finite element Formulation
% Geometrically Nonlinear Analysis of Laminated Composite Plate
% 
% Problem : To find the Central(Maximum) bending deflection and 
% stresses of composite plate when sinusoidally distributed 
% transverse load sin((pi/a)*x)*sin((pi/b)*y)
% 
% Origin is assumed to be at centre of the plate
% (-L/2,B/2)      (0,B/2)         (L/2,B/2)
% (-L/2,0)        (0,0)           (L/2,0)
% (-L/2,-B/2)     (0,-B/2)        (L/2,-B/2)
% By doing this only we need to change the force component 
% ( replace 'sin' term with 'cos' term)
% 
%               y_new
%   y           ^
%   ^           |
%   |           |
%   |   L/2       |
%   |<----->    o-------->  x_new
%   |       ^
%   |       |B/2
%   |       |
%   |       v
%   o---------------------------->x
%   x = L/2 + x_new , y = B/2 + new
%   sin((pi/L)*x) = cos((pi/L)*x_new)
%   sin((pi/B)*y) = cos((pi/B)*y_new)
% 
% Layer layout
% Upper layer (3) (z axis positive)
% Middle layer (2) (z = 0)
% Lower layer (1)  (z axis negative)
%%

folder = 'plots';
if(~exist(folder,'dir'))
mkdir(folder)
end

clc;                    % clear command windows
close all;              % close all pop up windows
clear all;              % clear all variables in Workspace
format shortG;
fprintf('Please wait programme is under run...\n');

%%
%------------------------
% Problem_L_1 : 0/90/90/0
%------------------------
% Parameter.Load = 'UDL';
% Parameter.Load = 'SSL';
% Parameter.gamma = 1e7; % Penalty Parameter
% Parameter.NL = 0; % Linear : 0; NonLinear : 1
% Parameter.Type = 'Linear';
% Parameter.Type = 'vonKarman';
% Parameter.Type = 'Green';
% Parameter.Theory = 'Ferreira';
% Parameter.Theory = 'IHSDT';
% Parameter.Theory = 'TSDT';
% Parameter.typeBC = 'SSSS1';
% Parameter.typeBC = 'SSSS2';

% E2 = 1;
% E1 = 25*E2;
% NU12 = 0.25;
% G12 = 0.5*E2;
% G13 = 0.5*E2;
% G23 = 0.2*E2;
% NU21 = (E2/E1)*NU12;
% rho = 1;

% E2 = 1;
% E1 = 40*E2;
% NU12 = 0.25;
% G12 = 0.6*E2;
% G13 = 0.6*E2;
% G23 = 0.5*E2;
% NU21 = (E2/E1)*NU12;
% rho = 1;

% E2 = 1;
% E1 = E2;
% NU12 = 0.25;
% G12 = 0.5*E2/(1+NU12);
% G13 = G12;
% G23 = G12;
% NU21 = (E2/E1)*NU12;
% rho = 1;

% Lx = 1;
% Ly = Lx;
% h = Lx/4;
% [ar_N,ar_D] = rat(h/Lx); % Aspect Ratio

% theta = [0;90;90;0;];

% theta = [0;];
% theta = [0;90;];
% theta = [0;90;0;90;0;90];

% thetaAngle = 5;
% theta = [thetaAngle; -thetaAngle;];
% theta = [thetaAngle; -thetaAngle; thetaAngle; -thetaAngle; thetaAngle; -thetaAngle];

% LoadFactor = 1;
% TotalLoad = 1/LoadFactor;
% % LoadStep = 1;
% DiscreateLoad = unique(1)/LoadFactor;
% LoadStep = length(DiscreateLoad);

%%
%---------------------------
% Problem_NL_1 : 0 Isotropic (Backup of Problem : 3)
%---------------------------
% % Parameter.Load = 'UDL';
% Parameter.Load = 'SSL';
% Parameter.gamma = 1e7; % Penalty Parameter
% % Parameter.NL = 1; % Nonlinearity Parameter
% % Parameter.Type = 'Linear';
% % Parameter.Type = 'vonKarman';
% Parameter.Type = 'Green';
% Parameter.Theory = 'IHSDT';
% % Parameter.Theory = 'TSDT';
% Parameter.typeBC = 'CCCC'; % Boundary Condition
% 
% Material Properties
% E2 = 206.84e9;
% E1 = E2;
% NU12 = 0.316;
% G12 = 206.84e9/(2+2*NU12);
% G13 = G12;
% G23 = G12;
% NU21 = (E2/E1)*NU12;
% rho = 1;
% 
% Plate Geometry
% Lx = 300;
% Ly = Lx;
% h = 3;
% [ar_N,ar_D] = rat(h/Lx); % Aspect Ratio
% 
% Ply Orientation
% theta = 0;
% 
% LoadFactor = (Lx^4)/(E2*h^4);
% % TotalLoad = 400/LoadFactor;
% % LoadStep = 16;
% DiscreateLoad = unique([20:20:100,100:50:400])/LoadFactor;
% LoadStep = length(DiscreateLoad);
% 
% file = sprintf('Poblem_NL_1_%s_%s_h_a_%g_%g_%s_%s',...
%     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC)
% save(fullfile(pwd,'plots',[file,'.mat']),'Data_W','Data_xx');

%%
%---------------------------
% Problem_NL_3
%---------------------------
% Parameter.Load = 'UDL';
% % Parameter.Load = 'SSL';
% Parameter.gamma = 1e7; % Penalty Parameter
% % Parameter.NL = 1; % Nonlinearity Parameter
% % Parameter.Type = 'Linear';
% % Parameter.Type = 'vonKarman';
% Parameter.Type = 'Green';
% Parameter.Theory = 'IHSDT';
% % Parameter.Theory = 'TSDT';
% % Parameter.typeBC = 'SSSS1';
% Parameter.typeBC = 'SSSS4';
% % Parameter.typeBC = 'CCCC';
% 
% % Material Properties
% E2 = 7.8e6;
% E1 = E2;
% NU12 = 0.3;
% G12 = E2/(2+2*NU12);
% G13 = G12;
% G23 = G12;
% NU21 = (E2/E1)*NU12;
% rho = 1;
% 
% % Plate Geometry
% Lx = 10;
% Ly = Lx;
% h = 1;
% [ar_N,ar_D] = rat(h/Lx); % Aspect Ratio
% 
% % Ply Orientation
% theta = 0;
% 
% LoadFactor = (Lx^4)/(E2*h^4);
% TotalLoad = 200/LoadFactor;
% % LoadStep = 16;
% DiscreateLoad = unique([6.25,12.5,25:25:200])/LoadFactor;
% LoadStep = length(DiscreateLoad);
% 
% file = sprintf('Poblem_NL_3_%s_%s_h_a_%g_%g_%s_%s',...
%     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC)
% save(fullfile(pwd,'plots',[file,'.mat']),'Data_W','Data_xx');

%%
%---------------------------
% Problem_NL_5 : Different Boundary
%---------------------------
% Parameter.Load = 'UDL';
% % Parameter.Load = 'SSL';
% Parameter.gamma = 1e7; % Penalty Parameter
% % Parameter.NL = 1; % Nonlinearity Parameter
% % Parameter.Type = 'Linear';
% % Parameter.Type = 'vonKarman';
% Parameter.Type = 'Green';
% Parameter.Theory = 'IHSDT';
% % Parameter.Theory = 'TSDT';
% % Parameter.typeBC = 'CCCC1';
% % Parameter.typeBC = 'SSSS1';
% % Parameter.typeBC = 'SSSS2';
% % Parameter.typeBC = 'SSSS3';
% % Parameter.typeBC = 'SSSS4';
% Parameter.typeBC = 'SSFS1';
% % Parameter.typeBC = 'SSFS2';
% % Parameter.typeBC = 'SSFS3';
% % Parameter.typeBC = 'SSFS4';
% % Parameter.typeBC = 'CCFC4';
% % Parameter.typeBC = 'CFFF4';
% 
% % Material Properties
% E2 = 7.8e6;
% E1 = E2;
% NU12 = 0.3;
% G12 = E2/(2+2*NU12);
% G13 = G12;
% G23 = G12;
% NU21 = (E2/E1)*NU12;
% rho = 1;
% 
% % Plate Geometry
% Lx = 10;
% Ly = Lx;
% h = 1;
% [ar_N,ar_D] = rat(h/Lx); % Aspect Ratio
% 
% % Ply Orientation
% theta = 0;
% 
% LoadFactor = (Lx^4)/(E2*h^4);
% % TotalLoad = 400/LoadFactor;
% % LoadStep = 16;
% DiscreateLoad = unique([6.25,12.5,25:25:400])/LoadFactor;
% LoadStep = length(DiscreateLoad);
% 
% file = sprintf('Poblem_NL_5_%s_%s_h_a_%g_%g_%s_%s',...
%     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC)
% % save(fullfile(pwd,'plots',[file,'.mat']),'Data_W','Data_xx');

%%
% %---------------------------
% % Problem_NL_6 : Orthotropic Plate
% %---------------------------
% Parameter.Load = 'UDL';
% % Parameter.Load = 'SSL';
% Parameter.gamma = 1e7; % Penalty Parameter
% % Parameter.NL = 1; % Nonlinearity Parameter
% % Parameter.Type = 'Linear';
% % Parameter.Type = 'vonKarman';
% Parameter.Type = 'Green';
% Parameter.Theory = 'IHSDT';
% % Parameter.Theory = 'TSDT';
% % Parameter.typeBC = 'CCCC';
% Parameter.typeBC = 'SSSS1';
% 
% %---------------
% % Problem_NL_6_1
% %---------------
% % Material Properties : Orthrotropic
% E2 = 1.28e6;
% E1 = 3e6;
% NU12 = 0.32;
% G12 = 0.37e6;
% G13 = G12;
% G23 = G12;
% NU21 = (E2/E1)*NU12;
% rho = 1;
% 
% % Plate Geometry : : Orthrotropic
% Lx = 12;
% Ly = Lx;
% h = 0.138;
% [ar_N,ar_D] = rat(h/Lx); % Aspect Ratio
% 
% % Ply Orientation
% theta = 0;
% 
% % file = sprintf('Poblem_NL_6_1_%s_%s_0_%s_%s_Penalty_%g',...
% %     Parameter.Type,Parameter.Load,Parameter.Theory,Parameter.typeBC,log10(Parameter.gamma))
% 
% %---------------
% % Problem_NL_6_2
% %---------------
% % Material Properties : 0/90/90/0 
% E2 = 1.8315e6;
% E1 = 1.8282e6;
% NU12 = 0.2395;
% G12 = 3.125e5;
% G13 = G12;
% G23 = G12;
% NU21 = (E2/E1)*NU12;
% rho = 1;
% 
% % Plate Geometry : : 0/90/90/0
% Lx = 12;
% Ly = Lx;
% h = 0.096;
% [ar_N,ar_D] = rat(h/Lx); % Aspect Ratio
% 
% % Ply Orientation
% theta = [0;90;90;0];
% 
% file = sprintf('Poblem_NL_6_2_%s_%s_0_90_90_0_%s_%s_Penalty_%g',...
%     Parameter.Type,Parameter.Load,Parameter.Theory,Parameter.typeBC,log10(Parameter.gamma))
% 
% LoadFactor = 1;
% DiscreateLoad = unique([0.2:0.2:2])/LoadFactor;
% LoadStep = length(DiscreateLoad);
% % 
% % save(fullfile(pwd,'plots',[file,'.mat']),'Data_W');

%%
%---------------------------
% Problem_NL_7 : Hinged 0/90/90/0
%---------------------------
% Parameter.Load = 'UDL';
% % Parameter.Load = 'SSL';
% Parameter.gamma = 1e7; % Penalty Parameter
% % Parameter.NL = 1; % Nonlinearity Parameter
% % Parameter.Type = 'Linear';
% Parameter.Type = 'vonKarman';
% % Parameter.Type = 'Green';
% % Parameter.Theory = 'IHSDT';
% Parameter.Theory = 'TSDT';
% % Parameter.typeBC = 'CCCC';
% % Parameter.typeBC = 'SSSS1';
% % Parameter.typeBC = 'SSSS2';
% % Parameter.typeBC = 'SSSS3';
% % Parameter.typeBC = 'SSSS4';
% % Parameter.typeBC = 'SSFS1';
% % Parameter.typeBC = 'SSFS2';
% Parameter.typeBC = 'SSFS3';
% % Parameter.typeBC = 'SSFS4';
% % Parameter.typeBC = 'CCFC4';
% % Parameter.typeBC = 'CFFF4';
% 
% % Material Properties
% E2 = 1;
% E1 = 25*E2;
% NU12 = 0.25;
% G12 = 0.5*E2;
% G13 = G12;
% G23 = 0.2*E2;
% NU21 = (E2/E1)*NU12;
% rho = 1;
% 
% % Plate Geometry
% Lx = 1;
% Ly = Lx;
% h = Lx/4;
% [ar_N,ar_D] = rat(h/Lx); % Aspect Ratio
% 
% % Ply Orientation
% theta = [0;90;90;0];
% 
% LoadFactor = (Lx^4)/(E2*h^4);
% DiscreateLoad = unique([50:50:250])/LoadFactor;
% LoadStep = length(DiscreateLoad);
% 
% file = sprintf('Poblem_NL_7_%s_%s_h_a_%g_%g_%s_%s',...
%     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC)
% % save(fullfile(pwd,'plots',[file,'.mat']),'Data_W','Data_xx');

%%
%---------------------------
% Problem_NL_8 : SSSS1 0/90/0 and 0/90/90/0
%---------------------------
% % Parameter.Load = 'UDL';
% Parameter.Load = 'SSL';
% Parameter.gamma = 0*1e7; % Penalty Parameter
% % Parameter.NL = 1; % Nonlinearity Parameter
% % Parameter.Type = 'Linear';
% % Parameter.Type = 'vonKarman';
% Parameter.Type = 'Green';
% Parameter.Theory = 'IHSDT';
% % Parameter.Theory = 'TSDT';
% % Parameter.typeBC = 'CCCC';
% Parameter.typeBC = 'SSSS1';
% % Parameter.typeBC = 'SSSS2';
% % Parameter.typeBC = 'SSSS3';
% % Parameter.typeBC = 'SSSS4';
% % Parameter.typeBC = 'SSFS1';
% % Parameter.typeBC = 'SSFS2';
% % Parameter.typeBC = 'SSFS3';
% % Parameter.typeBC = 'SSFS4';
% % Parameter.typeBC = 'CCFC4';
% % Parameter.typeBC = 'CFFF4';
% 
% % Material Properties
% % E2 = 1;
% % E1 = 25*E2;
% % NU12 = 0.25;
% % G12 = 0.5*E2;
% % G13 = G12;
% % G23 = 0.2*E2;
% % NU21 = (E2/E1)*NU12;
% % rho = 1;
% 
% % Plate Geometry
% Lx = 1;
% Ly = Lx;
% h = Lx/10;
% [ar_N,ar_D] = rat(h/Lx); % Aspect Ratio
% 
% % Ply Orientation
% theta = [0;90;90;0];
% % theta = [0;90;0];
% 
% LoadFactor = (Lx^4)/(E2*h^4);
% TotalLoad = 300/LoadFactor;
% DiscreateLoad = unique([50,100:100:300])/LoadFactor;
% LoadStep = length(DiscreateLoad);

% file = sprintf('Poblem_NL_8_%s_%s_h_a_%g_%g_%s_%s_0_90_0',...
%     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC)
% file = sprintf('Poblem_NL_8_%s_%s_h_a_%g_%g_%s_%s_0_90_90_0',...
%     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC)
% save(fullfile(pwd,'plots',[file,'.mat']),...
%     'Data_W','IndexZ','temp_xx','temp_yy','temp_xy','temp_yz','temp_xz');

%%
%---------------------------
% Problem_NL_9 : SSSS1 (0/90)n and -theta/theta/-theta/theta and -theta/theta/theta/-theta
%---------------------------
% % Parameter.Load = 'UDL';
% Parameter.Load = 'SSL';
% Parameter.gamma = 1e7; % Penalty Parameter
% % Parameter.NL = 1; % Nonlinearity Parameter
% % Parameter.Type = 'Linear';
% % Parameter.Type = 'vonKarman';
% Parameter.Type = 'Green';
% Parameter.Theory = 'IHSDT';
% % Parameter.Theory = 'TSDT';
% Parameter.typeBC = 'SSSS1';
% % Parameter.typeBC = 'SSSS2';
% 
% % E2 = 1;
% % E1 = 25*E2;
% % NU12 = 0.25;
% % G12 = 0.5*E2;
% % G13 = G12;
% % G23 = 0.2*E2;
% % NU21 = (E2/E1)*NU12;
% % rho = 1;
% 
% % Old Data for Problem 9 _1 _2 _3 _4
% E2 = 1;
% E1 = 40*E2;
% NU12 = 0.25;
% G12 = 0.6*E2;
% G13 = G12;
% G23 = 0.5*E2;
% NU21 = (E2/E1)*NU12;
% rho = 1;
% 
% % Plate Geometry
% Lx = 1;
% Ly = Lx;
% h = Lx/4;
% [ar_N,ar_D] = rat(h/Lx); % Aspect Ratio
% 
% % % Problem_NL_9_1
% theta = [0;90;];
% % theta = [0;90;0;90;];
% % theta = [0;90;0;90;0;90];
% % theta = [0;90;0;90;0;90;0;90];
% % theta = [0;90;0;90;0;90;0;90;0;90;];
% 
% % % Problem_NL_9_2
% % theta_angle = 45;
% % theta = [-theta_angle;theta_angle;-theta_angle;theta_angle;];
% 
% % % Problem_NL_9_3
% % theta_angle = 0;
% % % theta = [-theta_angle;theta_angle;theta_angle;-theta_angle;];
% 
% LoadFactor = (Lx^4)/(E2*h^4);
% % DiscreateLoad = unique([25:25:300])/LoadFactor;
% DiscreateLoad = unique([50,100,200,300])/LoadFactor;
% LoadStep = length(DiscreateLoad);
% 
% file = sprintf('Poblem_NL_9_1_%s_%s_h_a_%g_%g_%s_%s_0_90_%g',...
%     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC,length(theta)/2)
% % file = sprintf('Poblem_NL_9_2_%s_%s_h_a_%g_%g_%s_%s_AS_%g',...
% %     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC,abs(theta(1)))
% % file = sprintf('Poblem_NL_9_3_%s_%s_h_a_%g_%g_%s_%s_AS_%g',...
% %     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC,abs(theta(1)))
% % file = sprintf('Poblem_NL_9_3_%s_%s_h_a_%g_%g_%s_%s_S_%g',...
% %     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC,abs(theta(1)))
% % save(fullfile(pwd,'plots',[file,'.mat']),'Data_W');

%%
% %---------------------------
% % Problem_NL_10 : Laminated different boundary condition
% %---------------------------
Parameter.Load = 'UDL';
% Parameter.Load = 'SSL';
Parameter.gamma = 1e7; % Penalty Parameter
% Parameter.NL = 1; % Nonlinearity Parameter
% Parameter.Type = 'Linear';
% Parameter.Type = 'vonKarman';
Parameter.Type = 'Green';
Parameter.Theory = 'IHSDT';
% Parameter.Theory = 'TSDT';
% Parameter.typeBC = 'CCCC4';
% Parameter.typeBC = 'SSSS1';
% Parameter.typeBC = 'SSSS2';
% Parameter.typeBC = 'SSSS3';
% Parameter.typeBC = 'SSSS4';
% Parameter.typeBC = 'CCFC4';
Parameter.typeBC = 'SSFS1';
% Parameter.typeBC = 'SSFS2';
% Parameter.typeBC = 'SSFS3';
% Parameter.typeBC = 'SSFS4';

E2 = 1;
E1 = 25*E2;
NU12 = 0.25;
G12 = 0.5*E2;
G13 = G12;
G23 = 0.2*E2;
NU21 = (E2/E1)*NU12;
rho = 1;

% E2 = 7.8e6;
% E1 = E2;
% NU12 = 0.3;
% G12 = E2/(2+2*NU12);
% G13 = G12;
% G23 = G12;
% NU21 = (E2/E1)*NU12;
% rho = 1;

% Plate Geometry
Lx = 1;
Ly = Lx;
h = Lx/20; %<====
[ar_N,ar_D] = rat(h/Lx); % Aspect Ratio

% Problem_NL_10_1
% theta = [0;90;90;0;];

% Problem_NL_10_2
theta = [0;90;0;90;];
% theta = [0;90;0;90;0;90;0;90;];

% Problem_NL_10_3
% theta = [0;90;0;90;];
% theta = [45;-45;45;-45;];

LoadFactor = (Lx^4)/(E2*h^4);
% DiscreateLoad = unique([6.25,12.5,25:25:400])/LoadFactor;
% DiscreateLoad = unique([25,50,100:50:400])/LoadFactor;
DiscreateLoad = unique([25,50,100,100:100:1000])/LoadFactor;
LoadStep = length(DiscreateLoad);

file = sprintf('Poblem_NL_10_1_%s_%s_h_a_%g_%g_%s_%s',...
    Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC)
% file = sprintf('Poblem_NL_10_2_%s_%s_h_a_%g_%g_%s_%s_0_90_%g',...
%     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC,length(theta)/2)
% file = sprintf('Poblem_NL_10_3_%s_%s_h_a_%g_%g_%s_%s_AS_CrossPly_%g',...
%     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC,length(theta)/2)
% file = sprintf('Poblem_NL_10_3_%s_%s_h_a_%g_%g_%s_%s_AS_AnglePly_%g',...
%     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC,length(theta)/2)
% save(fullfile(pwd,'plots',[file,'.mat']),'Data_W');

%%
if strcmp(Parameter.Type,'Linear')
    fprintf('Linear analysis\n');
elseif strcmp(Parameter.Type,'vonKarman')
	fprintf('Nonlinear analysis : von Karman\n');
elseif strcmp(Parameter.Type,'Green')
	fprintf('Nonlinear analysis : Green-Lagrange\n');
else
    error('Analysis Type\n');
end

fprintf('%s Load\n',Parameter.Load);
fprintf('%s\n',Parameter.typeBC);
fprintf('%s\n',Parameter.Theory);


%%
%--------------------------------------------------------------------------
% Material properties
%--------------------------------------------------------------------------


%%
%--------------------------------------------------------------------------
% Geometrical properties
%--------------------------------------------------------------------------
nol = length(theta);   % number of layers
disp(table(theta));
fprintf('Number of Layers : %d\n',nol);


%%
%--------------------------------------------------------------------------
% Transverse uniform pressure on plate
%--------------------------------------------------------------------------


%%
%--------------------------------------------------------------------------
% Discretization
%--------------------------------------------------------------------------
noe = 12;
fprintf('Number of element : %d X %d\n',noe,noe);
nx = noe;
ny = noe;
nel = nx*ny;                        % Total number of elements nel=nx*ny; 

nnel = 9;                           % number of control points per element
ndof = 7;                           % number of dofs per node

mx = 2*nx + 1;                      % Number of basis functions/control points in xi direction
my = 2*ny + 1;                      % Number of basis functions/control points in eta direction
nnode = mx*my;                        % Total number of basis functions/control points

edof = nnel*ndof;                   % degrees of freedom per element
sdof = nnode*ndof;                  % Global degrees of freedom= total CP's*DOF assumed for each CP i.e. total system dofs   

%--------------------------------------------------------------------------
% ELEMENT TOPOLOGY
%--------------------------------------------------------------------------
[Coordinate,IEN] = Mesh(Lx,Ly,mx,my,nnode);

%%
%--------------------------------------------------------------------------
% Material Matrix
%--------------------------------------------------------------------------
if strcmp(Parameter.Theory,'TSDT')
    % Third order theory
    funF = @(z) z - (4/(3*h^2))*z.^3;
    fundF = @(z) 1 - (4/h^2)*z.^2;
end

if strcmp(Parameter.Theory,'IHSDT')
    r = 3;
    funG = @(z) asinh(r*z/h);
    fundG = @(z) (r)./sqrt(r^2*z.^2 + h^2);
    funO = -2*r/(h*sqrt(r^2+4));

    funF = @(z) funO*z + funG(z);
    fundF = @(z) funO + fundG(z);
end

if strcmp(Parameter.Theory,'Ferreira')
    % Ferreira
    funF = @(z) sin(pi/h*z);
    fundF = @(z) (pi/h)*cos(pi/h*z);
end

[Qbar,B1Matrix,B2Matrix,B3Matrix,B4Matrix,...
    S1Matrix,S2Matrix,S3Matrix,S4Matrix] = MaterialProperty(...
    E1,E2,NU12,NU21,G12,G13,G23,h,theta,nol,funF,fundF);
%--------------------------------------------------------------------------
% Boundary conditions
%--------------------------------------------------------------------------
typeBC = Parameter.typeBC;
[prescribedbdof,activedof] = BoundaryCondition(my,mx,nnode,ndof,sdof,Coordinate,typeBC);

%--------------------------------------------------------------------------
%  Computation of element matrices and vectors and their assembly
%--------------------------------------------------------------------------
% Initial Condition for plot
Data_W(1,2) = 0;
Data_xx(1,2) = 0;
% Data_yy(1,2) = 0;
% Data_xy(1,2) = 0;
% Data_yz(1,2) = 0;
% Data_xz(1,2) = 0;

% Initial Condition for displacement
Displacement = zeros(sdof,LoadStep+1);

%--------------------------------------------------------------------------
% Initial Condition for stress recovery: Full analysis
%--------------------------------------------------------------------------
% LayerSegment = 3;
% IndexZ = zeros(nol*LayerSegment,1);
% MeshZ = linspace(-h/2,h/2,nol*(LayerSegment-1)+1);
% SprStress = zeros(nnode,5,LayerSegment*nol,LoadStep+1);
% temp_xx = zeros(size(IndexZ));
% temp_yy = zeros(size(IndexZ));
% temp_xy = zeros(size(IndexZ));
% temp_yz = zeros(size(IndexZ));
% temp_xz = zeros(size(IndexZ));

% Newton Raphson Condition
maxsIteration = 500;
tolerance = 1e-2;

Load = 0;
displacement = zeros(sdof,1);
for iLoad = 1:LoadStep
% Load = Load + (TotalLoad/LoadStep);
Load = DiscreateLoad(iLoad);
fprintf('\nCurrent Load : %g\n',Load);
fprintf('Normalized Load : %g\n',Load*LoadFactor);
fprintf('Iteration\tResidual Norm\tConvergance\n');
for iNR = 1:maxsIteration  % Newton-Raphson iteration

% Tangent stiffness, Secant stiffness and Force
[tangent,stiffness,force] = TSDT_5dof(Parameter,Load,Lx,Ly,h,...
    nel,nnel,ndof,nnode,edof,sdof,Coordinate,IEN,...
    B1Matrix,B2Matrix,B3Matrix,B4Matrix,...
    S1Matrix,S2Matrix,S3Matrix,S4Matrix,displacement);

% % Constraint imposition
% [tangent,stiffness,force] = Constraints(tangent,stiffness,force,prescribedbdof);
% % Solution
% residual = stiffness*displacement-force;
% deltadisplacement = -tangent\residual;
% % Delta Displacement is Added to Get New Displacement Vector
% displacement = displacement + deltadisplacement;
% % residualnorm = norm(residual);
% residualnorm = norm(residual(activedof));

residual = stiffness(activedof,activedof)*displacement(activedof,1)-force(activedof,1);
deltadisplacement = -tangent(activedof,activedof)\residual;
displacement(activedof,1) = displacement(activedof,1) + deltadisplacement;
residualnorm = norm(residual);

% norm(displacement(prescribedbdof))


convergancePara = norm(deltadisplacement)/...
    norm(displacement);
fprintf('\t%d\t\t%5.2g\t\t\t%5.2g\n',...
    iNR,residualnorm,convergancePara);
% if convergancePara<tolerance && residualnorm < tolerance
% if residualnorm < tolerance
if convergancePara<tolerance

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

%-----------
% Deflection 
%----------- 
Deflection = displacement(MiddleNode*ndof-(ndof-3));

%--------------------------------------------------------------------------
% Displacement 
%--------------------------------------------------------------------------
Displacement(:,iLoad+1) = displacement;

% --------------------------------------------------------------------------
% Stress Recovery : Full analysis
% -------------------------------------------------------------------------- 
% zloop = 1;
% for iNol = 1:nol
% for jLayer = 1:LayerSegment
% IndexZ(zloop) = MeshZ((iNol-1)*(LayerSegment-1)+jLayer);
% [SprStress(:,:,zloop,iLoad+1)] = SuperConvergantPatch(nx,ny,Qbar(:,:,iNol),IndexZ(zloop),IEN,Coordinate,displacement,funF,fundF,Parameter);
% zloop = zloop+1;
% end 
% end

%----------------
% Stress Recovery : Selected analysis
%---------------- 
% iNol = 1;
% IndexZ = h/2;
% SprStress = SuperConvergantPatch(nx,ny,Qbar(:,:,iNol),IndexZ,IEN,Coordinate,displacement,funF,fundF,Parameter);
% Sigma_xx = SprStress(MiddleNode,1); % 1 -> Sigma_xx
% Sigma_yy = SprStress(MiddleNode,2); % 2 -> Sigma_yy
% Sigma_xy = SprStress(MiddleNode,3); % 3 -> Sigma_xy
% Sigma_yz = SprStress(BottomNode,4); % 4 -> Tau_yz
% Sigma_xz = SprStress(LeftMiddleNode,5); % 5 -> Tau_xz

%---------------------------
% Problem_L_1 : 0/90/90/0 SSL SSSS-1
%---------------------------
% DeflectionFactor = (100*E2*h^3)/(Ly^4*Load); % Linear
% StressFactor_xx = h^2/(Ly^2*Load); % Linear
% StressFactor_yy = h^2/(Ly^2*Load); % Linear
% StressFactor_xy = h^2/(Ly^2*Load); % Linear
% StressFactor_yz = h/(Ly*Load); % Linear
% StressFactor_xz = h/(Ly*Load); % Linear

% Deflection*DeflectionFactor
% [squeeze(SprStress(MiddleNode,1,:,end))*StressFactor_xx,...
% squeeze(SprStress(MiddleNode,2,:,end))*StressFactor_yy,...
% squeeze(SprStress(LeftTopNode,3,:,end))*StressFactor_xy,...
% squeeze(SprStress(BottomNode,4,:,end))*StressFactor_yz,...
% squeeze(SprStress(LeftMiddleNode,5,:,end))*StressFactor_xz]
% return

%---------------------------
% Problem_NL_1 : 0 Isotropic
% Problem_NL_3 : 0 Isotropic
% Problem_NL_5 : 0 Isotropic Different Boundary Condition
% Problem_NL_7 : 0 Hinged 0/90/90/0
%---------------------------
% DeflectionFactor = 1/h;
% StressFactor_xx = Lx^2/(E2*h^2);

%---------------------------
% Problem_NL_6_1 : 0 Orthotropic
% Problem_NL_6_2 : 0/90/90/0 Laminated
%---------------------------
% DeflectionFactor = 1;
% StressFactor_xx = 1; % Not calculated

%---------------------------
% Problem_NL_8_1 : SSSS1 0/90/90/0 and 0/90/0
%---------------------------
% DeflectionFactor = 1/h;
% StressFactor_xx = h^2/(Ly^2*Load); % Linear
% StressFactor_yy = h^2/(Ly^2*Load); % Linear
% StressFactor_xy = h^2/(Ly^2*Load); % Linear
% StressFactor_yz = h/(Ly*Load); % Linear
% StressFactor_xz = h/(Ly*Load); % Linear
% temp_xx(:,iLoad+1) = squeeze(SprStress(MiddleNode,1,:,iLoad+1))*StressFactor_xx;
% temp_yy(:,iLoad+1) = squeeze(SprStress(MiddleNode,2,:,iLoad+1))*StressFactor_yy;
% temp_xy(:,iLoad+1) = squeeze(SprStress(LeftTopNode,3,:,iLoad+1))*StressFactor_xy;
% temp_yz(:,iLoad+1) = squeeze(SprStress(BottomNode,4,:,iLoad+1))*StressFactor_yz;
% temp_xz(:,iLoad+1) = squeeze(SprStress(LeftMiddleNode,5,:,iLoad+1))*StressFactor_xz;

%---------------------------
% Problem_NL_9 : SSSS1 (0/90)_n and -theta/theta/theta/-theta and -theta/theta/-theta/theta
% Problem_NL_10 : SSSS4 (0/90)_n and (theta/-theta)_n
%---------------------------
DeflectionFactor = 1/h;

fprintf('Deflection : %g\n',Deflection);
fprintf('Normalized Deflection : %g\n',Deflection*DeflectionFactor);
Data_W(iLoad+1,:) = [Load*LoadFactor,Deflection*DeflectionFactor];
% Data_W(iLoad+1,:) = [Load,Deflection*DeflectionFactor];
% Data_W(iLoad+1,:) = [Load,Deflection];

% fprintf('Sigma_xx : %g\n',Sigma_xx);
% fprintf('Normalized Sigma_xx : %g\n',Sigma_xx*StressFactor_xx);
% Data_xx(iLoad+1,:) = [Load*LoadFactor,Sigma_xx*StressFactor_xx];
% Data_xx(iLoad+1,:) = [Load,Sigma_xx*DeflectionFactor];
% Data_xx(iLoad+1,:) = [Load,Sigma_xx];

break;
end
end % NR iteration

end % load

% continue;
%%
% figure;
% fig_size = get(0,'screensize');
% fig_size(3) = fig_size(3)/2;
% set(gcf,'Position',fig_size);
% set(gcf,'PaperPositionMode','auto');
% set(gcf,'name',file,'numbertitle','off');
% hold on;

Colors = [
      0.16,     0.44,    1.00;
      0.93,     0.00,    0.00;
      0.00,     0.57,    0.00;
      0.17,     0.17,    0.17;
      0.44,     0.00,    0.99;
      1.00,     0.50,    0.10;
      0.75,     0.00,    0.75;
      0.50,     0.50,    0.50;
      0.50,     0.57,    0.00;
      0.00,     0.00,    0.00;
      ];

figure;
hold on;
plot(Data_W(:,1),Data_W(:,2),...
    '-o','MarkerSize',15,'LineWidth',4,'color',Colors(1,:));


% Data = [
%    0.10000       1.04615     
%    0.17500       1.50893     
%    0.25000       1.80496     
%    0.36250       2.08619     
%    0.53125       2.33558     
%    0.70000       2.48989     
%    0.85000       2.58676     
%     1.0000       2.66127     
% ];

% Data = [
%    0.10000      0.909330     
%    0.20000       1.37647     
%    0.35000       1.76905     
%    0.57500       2.09235     
%    0.91250       2.35121     
%     1.0000       2.39613      
% ];

% a/h = 20 0/90_2
Data = [
   0.10000E-01  0.132091     
   0.20000E-01  0.263871     
   0.30000E-01  0.394889     
   0.40000E-01  0.524570     
   0.50000E-01  0.652378     
   0.60000E-01  0.777869     
   0.70000E-01  0.900681     
   0.80000E-01   1.02052     
   0.90000E-01   1.13716     
   0.10000       1.25042     
   0.11000       1.36018     
   0.12000       1.46636     
   0.13000       1.56893     
   0.14000       1.66789     
   0.15000       1.76325     
   0.16000       1.85508     
   0.17000       1.94343     
   0.18000       2.02839     
   0.19000       2.11006     
   0.20000       2.18853       
   0.21000       2.26392     
   0.22000       2.33634     
   0.23000       2.40589     
   0.24000       2.47270     
   0.25000       2.53688     
   0.26000       2.59855     
   0.27000       2.65781     
   0.28000       2.71478     
   0.29000       2.76956     
   0.30000       2.82225     
   0.31000       2.87295     
   0.32000       2.92177     
   0.33000       2.96878     
   0.34000       3.01408     
   0.35000       3.05776     
   0.36000       3.09988     
   0.37000       3.14054     
   0.38000       3.17980     
   0.39000       3.21772     
   0.40000       3.25439       
   0.41000       3.28985     
   0.42000       3.32416     
   0.43000       3.35739     
   0.44000       3.38958     
   0.45000       3.42079     
   0.46000       3.45105     
   0.47000       3.48042     
   0.48000       3.50894     
   0.49000       3.53664     
   0.50000       3.56356     
   0.51000       3.58975     
   0.52000       3.61522     
   0.53000       3.64002     
   0.54000       3.66417     
   0.55000       3.68770     
   0.56000       3.71064     
   0.57000       3.73301     
   0.58000       3.75484     
   0.59000       3.77615     
   0.60000       3.79695        
   0.61000       3.81727     
   0.62000       3.83714     
   0.63000       3.85655     
   0.64000       3.87555     
   0.65000       3.89413     
   0.66000       3.91231     
   0.67000       3.93012     
   0.68000       3.94756     
   0.69000       3.96464     
   0.70000       3.98138     
   0.71000       3.99780     
   0.72000       4.01389     
   0.73000       4.02968     
   0.74000       4.04518     
   0.75000       4.06038     
   0.76000       4.07531     
   0.77000       4.08997     
   0.78000       4.10436     
   0.79000       4.11851     
   0.80000       4.13241      
   0.81000       4.14608     
   0.82000       4.15951     
   0.83000       4.17272     
   0.84000       4.18572     
   0.85000       4.19850     
   0.86000       4.21108     
   0.87000       4.22346     
   0.88000       4.23565     
   0.89000       4.24765     
   0.90000       4.25947     
   0.91000       4.27111     
   0.92000       4.28258     
   0.93000       4.29388     
   0.94000       4.30501     
   0.95000       4.31599     
   0.96000       4.32680     
   0.97000       4.33747     
   0.98000       4.34799     
   0.99000       4.35836     
    1.0000       4.36859        
];

% a/h = 50 p1
% Data = [
%    0.10000E-01  0.713604E-001
%    0.20000E-01  0.142600     
%    0.35000E-01  0.249026     
%    0.57500E-01  0.407171     
%    0.91250E-01  0.639886     
%    0.14188      0.977577     
%    0.21781       1.46077     
%    0.31781       2.06072     
%    0.41781       2.58026     
%    0.51781       3.09991     
%    0.61781       3.60434     
%    0.71781       4.02635     
%    0.81781       4.44211     
%    0.91781       4.84337     
%     1.0000       5.15095    
% ];

Data(:,1) = Data(:,1)*1000;
plot(Data(:,1),Data(:,2),'-','MarkerSize',15,'LineWidth',4,'color',Colors(2,:));

% figure;
% plot(Data_xx(:,1),Data_xx(:,2),...
%     '-p','MarkerSize',15,'LineWidth',4,'color',Colors(1,:));
