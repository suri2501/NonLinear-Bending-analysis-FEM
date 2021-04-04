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
% Parameter.Load = 'UDL';
% % Parameter.Load = 'SSL';
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
% % Problem_NL_9_1
% % theta = [0;90;];
% % theta = [0;90;0;90;];
% % theta = [0;90;0;90;0;90];
% % theta = [0;90;0;90;0;90;0;90];
% % theta = [0;90;0;90;0;90;0;90;0;90;];
% 
% % % Problem_NL_9_2
% theta_angle = 45;
% theta = [-theta_angle;theta_angle;-theta_angle;theta_angle;];
% 
% % % Problem_NL_9_3
% % theta_angle = 0;
% % % theta = [-theta_angle;theta_angle;theta_angle;-theta_angle;];
% 
% LoadFactor = (Lx^4)/(E2*h^4);
% DiscreateLoad = unique([25:25:300])/LoadFactor;
% % DiscreateLoad = unique([50,100,200,300])/LoadFactor;
% LoadStep = length(DiscreateLoad);
% 
% % file = sprintf('Poblem_NL_9_1_%s_%s_h_a_%g_%g_%s_%s_0_90_%g',...
% %     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC,length(theta)/2)
% file = sprintf('Poblem_NL_9_2_%s_%s_h_a_%g_%g_%s_%s_AS_%g',...
%     Parameter.Type,Parameter.Load,ar_N,ar_D,Parameter.Theory,Parameter.typeBC,abs(theta(1)))
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
Lx = 10;
Ly = Lx;
h = Lx/10; %<====
[ar_N,ar_D] = rat(h/Lx); % Aspect Ratio

% Problem_NL_10_1
theta = [0;90;90;0;];

% Problem_NL_10_2
% theta = [0;90;0;90;];
% theta = [0;90;0;90;0;90;0;90;];

% Problem_NL_10_3
% theta = [0;90;0;90;];
% theta = [45;-45;45;-45;];

DeflectionFactor = 1/h;
LoadFactor = (Lx^4)/(E2*h^4);
DiscreateLoad = 1000/LoadFactor;
% DiscreateLoad = unique([25,50,100:100:1000])/LoadFactor;
% DiscreateLoad = unique([25,50,100:25:1000])/LoadFactor;
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
LambdaDisp = [];

% Point 1
Disp = zeros(sdof,1);
Lambda = 0;
DispPrev2 = Disp;
LambdaPrev2 = Lambda;
uTangentPrev2 = zeros(size([LambdaPrev2;DispPrev2])); 
converged2 = false;
IterPrev2 = 1; % Default
LambdaDisp = [LambdaDisp,[Lambda;Disp]];

[NonLoad,NonCen_W] = PostProcess(DiscreateLoad,DeflectionFactor,LoadFactor,nx,ny,mx,my,nnode,ndof,sdof,...
    Lambda,Disp);
plot(NonLoad,NonCen_W,':ob','LineWidth',3);
drawnow;
hold on;

% Point 2
Disp = zeros(sdof,1);
Lambda = 0;
DispPrev = Disp;
LambdaPrev = Lambda;
uTangentPrev = zeros(size([LambdaPrev;DispPrev])); % Default
converged1 = false;
IterPrev = 1; % Default
LambdaDisp = [LambdaDisp,[Lambda;Disp]];

[NonLoad,NonCen_W] = PostProcess(DiscreateLoad,DeflectionFactor,LoadFactor,nx,ny,mx,my,nnode,ndof,sdof,...
    Lambda,Disp);
plot(NonLoad,NonCen_W,':ob','LineWidth',3);
drawnow;
hold on;
%% Arc-Length Method
iStep_Max = 500;
iNR_Max = 30;
tolerance = 1e-2;
 
LambdaIncr = 0.025; % + for increase/ - for decrease 

% Flow direction
Lambda_S = 0; Lambda_E = 1;
LambdaDir = sign(Lambda_E-Lambda_S); % or simply dive +1 for loading; -1 for unloading 
BreakFlag = false; % To stop the simulation from going outside range

for iStep = 1:iStep_Max
fprintf('\n');
converged = false;

%%
% Prector Step
if iStep == 1
    LambdaScale = 1;
    Ds = LambdaIncr; % Assumed
    uTangentPrev = zeros(size([LambdaPrev;DispPrev]));
    uTangentPrev(1) = LambdaDir; % Assumed load increment only

else
    % Adaptive Step scale
    if converged1
        if converged2
            
            % Adapative Method
%             LambdaScale = IterPrev2/IterPrev; % for cylindrical
%             LambdaScale = 5/IterPrev; % for cylindrical
%             LambdaScaleTemp = LambdaScale;
%             LambdaScale = 4/IterPrev;

            LambdaScale = LambdaScale*1.1;
            
            % Restrict Lambda Scale Factor
            LambdaScale = min(LambdaScale,2); % maximum scaling; 2 times for spherical; 4 for cylndrical
            fprintf('Stepsize increased\n');
        else
            fprintf('##Stepsize kept same\n');
        end
    else
        LambdaScale = LambdaScale/2;
        LambdaScale = max(LambdaScale,1/2^20);
        fprintf('**Stepsize decreased\n');
        if LambdaScale < 1/2^20
            fprintf('Cant further reduce the stepsize\n');
            break;
        end
    end
    
    % Tangent stiffness, Secant stiffness and Force
    [tangent,stiffness,force] = TSDT_5dof(Parameter,DiscreateLoad(end),Lx,Ly,h,...
        nel,nnel,ndof,nnode,edof,sdof,Coordinate,IEN,...
        B1Matrix,B2Matrix,B3Matrix,B4Matrix,...
        S1Matrix,S2Matrix,S3Matrix,S4Matrix,Disp);
    
    Stiffness_Reduced = stiffness(activedof,activedof);
    Tangent_Reduced = tangent(activedof,activedof);
    Force_Reduced = force(activedof,1);
    Disp_Reduced = Disp(activedof,1);
    
    % Calculation of Unit tangent for (prediction step) or (initial incnrement)
	dR = Stiffness_Reduced*Disp_Reduced - Lambda*Force_Reduced;
    dRdu = Tangent_Reduced;
    dRdl = -Force_Reduced;

    LambdaDot = LambdaDir/sqrt(norm(dRdu\dRdl)+1);
    DispDot = -(dRdu\dRdl)*LambdaDot;
    
    DispDot_Full = zeros(sdof,1);
    DispDot_Full(activedof,1) = DispDot;
    
    uTangentPrev = [LambdaDot;DispDot_Full];
    uTangentPrev = uTangentPrev/norm(uTangentPrev); % just for assurance
    
%     if uTangentPrev2'*uTangentPrev < 0
%     if uTangentPrev2(1)'*uTangentPrev(1) <= 0 || uTangentPrev2(2:end)'*uTangentPrev(2:end) <= 0
%     if uTangentPrev2(2:end)'*uTangentPrev(2:end) <= 0
    if uTangentPrev2(2:end)'*uTangentPrev(2:end) <= 0 || (DispPrev-DispPrev2)'*uTangentPrev(2:end) <=0
%         [uTangentPrev2(1)'*uTangentPrev(1),uTangentPrev2(2:end)'*uTangentPrev(2:end),(DispPrev-DispPrev2)'*uTangentPrev(2:end)]
        uTangentPrev = -uTangentPrev;
    end

end

% Increasing StepSize is constraint
if LambdaScale > 1
    LambdaScale = 1; % for spherical
end

fprintf('Step : %d, StepScale : %g\n',iStep,LambdaScale);
Dul = uTangentPrev*LambdaScale*Ds;
Dl = Dul(1);
Du = Dul(2:end);
Lambda = LambdaPrev + Dl;
Disp = DispPrev + Du;

[NonLoad,NonCen_W] = PostProcess(DiscreateLoad,DeflectionFactor,LoadFactor,nx,ny,mx,my,nnode,ndof,sdof,...
    Lambda,Disp);
plot(NonLoad,NonCen_W,':ok','LineWidth',3);
drawnow;
hold on;


%%
% Corrector Step
for iNR = 1:iNR_Max
    
    % Tangent stiffness, Secant stiffness and Force
    [tangent,stiffness,force] = TSDT_5dof(Parameter,DiscreateLoad(end),Lx,Ly,h,...
        nel,nnel,ndof,nnode,edof,sdof,Coordinate,IEN,...
        B1Matrix,B2Matrix,B3Matrix,B4Matrix,...
        S1Matrix,S2Matrix,S3Matrix,S4Matrix,Disp);
    
    Stiffness_Reduced = stiffness(activedof,activedof);
    Tangent_Reduced = tangent(activedof,activedof);
    Force_Reduced = force(activedof,1);
    Disp_Reduced = Disp(activedof,1);
    
	dR = Stiffness_Reduced*Disp_Reduced - Lambda*Force_Reduced;
    dRdu = Tangent_Reduced;
    dRdl = -Force_Reduced;
    
    % Solving Approach : 1
    [L, U, P] = lu(sparse(dRdu));
    %
    duu = L\(P*dRdl);
    duCap = U\duu;
    duCap = -duCap;
    %
    duu = L\(P*dR);
    duBar = U\duu;
    duBar = -duBar;
    
%     % Solving Approach : 2
%     duBar = -dRdu\dR;
%     duCap = -dRdu\dRdl;
    
%     phi = 0; % Original; % for cylindrical
    phi = 1; % for spherical
    FtF = 1;
%     FtF = dRdl'*dRdl;
    phi = phi*FtF; % Modified
    
    
    % Constraint Approach : 1
    % Spherical constraint
    % Method : 1
%     if (iStep > 1)
%         Du_Reduced = Du(Activedof);
%         dF = Du_Reduced'*Du_Reduced + phi*Dl*Dl - LambdaScale^2*Ds^2;
%         dFdu = 2.0*Du_Reduced';
%         dFdl = 2.0*phi*Dl;
%     else
%         Du_Reduced = Du(Activedof);
%         dF = 0.0;
%         dFdu = 0.0*Du_Reduced';
%         dFdl = 1.0;
%     end
%     dl = (-dFdu*duBar - dF)/(dFdl+dFdu*duCap);
    
    % Constraint Approach : 1
    % Spherical constraint
    % Method : 2
    if (iStep > 1)
        Du_Reduced = Du(activedof);
        a1 = duCap'*duCap + phi;
        a2 = (Du_Reduced+duBar)'*duCap + phi*Dl;
        a3 = (duBar+Du_Reduced)'*(duBar+Du_Reduced) + phi*Dl*Dl - LambdaScale^2*Ds^2;
        dF = Du_Reduced'*Du_Reduced + phi*Dl*Dl - LambdaScale^2*Ds^2;
    else
        a1 = 1;
        a2 = 0;
        a3 = 0;
        dF = 0;
    end
    % solution possibility
    if (4*a2*a2-4*a1*a3)<0
        converged = false;
        break;
    end
    %
    dl_1=(-2*a2+sqrt(4*a2*a2-4*a1*a3))/(2*a1);
	dl_2=(-2*a2-sqrt(4*a2*a2-4*a1*a3))/(2*a1);
    %
	du_1 = duBar + dl_1*duCap;
	du_2 = duBar + dl_2*duCap;
    %
    du_1_Full = zeros(sdof,1);    du_2_Full = zeros(sdof,1);
    du_1_Full(activedof,1) = du_1;  du_2_Full(activedof,1) = du_2;
    %
	Du_1 = Du + du_1_Full;
	Du_2 = Du + du_2_Full;
    %
    if Du'*Du_1 > 0 && Du'*Du_2 < 0
        dl = dl_1;
    elseif Du'*Du_1 < 0 && Du'*Du_2 > 0
        dl = dl_2;
    else %deltaDis'*deltaDis1 > 0 && deltaDis'*deltaDis2 > 0
        if (dl_1+(0.5*a3/a2))^2 < (dl_2+(0.5*a3/a2))^2
            dl = dl_1;
        else
            dl = dl_2;
        end
    end

    % checking the limit of Lambda and according modified the sub-increment of Lambda
    if LambdaDir == 1 % Loading : Initial increase in load
        if Lambda + dl < Lambda_S
            dl = Lambda_S - Lambda;
            fprintf('Forward Start\n');
            BreakFlag = true;
            keyboard
        end

        if Lambda + dl > Lambda_E
            dl = Lambda_E - Lambda;
            fprintf('Forward End\n');
            BreakFlag = true;
%             keyboard
        end
    else % UnLoading : Initial decrease in load
        if Lambda + dl < Lambda_E
            dl = Lambda_E - Lambda;
            fprintf('Backward End\n');
            BreakFlag = true;
            keyboard
        end

        if Lambda + dl > Lambda_S
            dl = Lambda_S - Lambda;
            fprintf('Backward Start\n')
            BreakFlag = true;
            keyboard
        end
    end
    du = duBar + dl*duCap;
    
    du_Full = zeros(sdof,1);
    du_Full(activedof,1) = du;
    
    Du = Du + du_Full;
    Dl = Dl + dl;
    
    Disp = Disp + du_Full;
    Lambda = Lambda + dl;
    
    du_Norm = sqrt(du_Full'*du_Full + dl*dl)/sqrt(Disp'*Disp + Lambda*Lambda);
    dR_Norm = sqrt(dR'*dR + 1*dF*dF);
    if BreakFlag
        dR_Norm = sqrt(dR'*dR);
    end
    fprintf('Iter : %d, residual : %g\n',iNR,dR_Norm);
    if du_Norm < tolerance && dR_Norm < 1
        converged = true;
        break;
    end
    
    [NonLoad,NonCen_W] = PostProcess(DiscreateLoad,DeflectionFactor,LoadFactor,nx,ny,mx,my,nnode,ndof,sdof,...
    Lambda,Disp);
    plot(NonLoad,NonCen_W,':or','LineWidth',3);
    drawnow;
    hold on;

end

%%
% After Corrector Step
if converged
    if iStep == 1
        Du_Reduced = Du(activedof);
        Ds = sqrt(Du_Reduced'*Du_Reduced + phi*Dl*Dl); % Set for default step size
%         Ds = sqrt(Du'*Du + phi*Dl*Dl); % Set for default step size
        
        % Tangent stiffness, Secant stiffness and Force
        [tangent,stiffness,force] = TSDT_5dof(Parameter,DiscreateLoad(end),Lx,Ly,h,...
            nel,nnel,ndof,nnode,edof,sdof,Coordinate,IEN,...
            B1Matrix,B2Matrix,B3Matrix,B4Matrix,...
            S1Matrix,S2Matrix,S3Matrix,S4Matrix,Disp);

        Stiffness_Reduced = stiffness(activedof,activedof);
        Tangent_Reduced = tangent(activedof,activedof);
        Force_Reduced = force(activedof,1);
        Disp_Reduced = Disp(activedof,1);

        dR = Stiffness_Reduced*Disp_Reduced - Lambda*Force_Reduced;
        dRdu = Tangent_Reduced;
        dRdl = -Force_Reduced;
        
        LambdaDot = LambdaDir/sqrt(norm(dRdu\dRdl)+1);
        DispDot = -(dRdu\dRdl)*LambdaDot;
        
        DispDot_Full = zeros(sdof,1);
        DispDot_Full(activedof,1) = DispDot;
        
        uTangentPrev = [LambdaDot;DispDot_Full]; % Corrected for first increment
        uTangentPrev = uTangentPrev/norm(uTangentPrev); % just for assurance
    end
    
    DispPrev2 = DispPrev;
    DispPrev = Disp;
    
    LambdaPrev2 = LambdaPrev;
    LambdaPrev = Lambda;
    
    converged2 = converged1;
    converged1 = converged;
    
    IterPrev2 = IterPrev;
    IterPrev = iNR+1*0; % 1 Extra for prediction; 0 for increasing the stepsize    
    uTangentPrev2 = uTangentPrev;
    uTangentPrev = zeros(size([Lambda;Disp])); 
    % just set zero for maintaing the uniformity in the code
    % it is of not use as, it will be calculated in prection step
    
    LambdaDisp = [LambdaDisp,[Lambda;Disp]];
    
    [NonLoad,NonCen_W] = PostProcess(DiscreateLoad,DeflectionFactor,LoadFactor,nx,ny,mx,my,nnode,ndof,sdof,...
    Lambda,Disp);
    plot(NonLoad,NonCen_W,':ob','LineWidth',3);
    drawnow;
    hold on;
    
    if BreakFlag
        break;
    end
    
else
    if iStep == 1
        fprintf('Step size must be reduced\n');
        break;
    end
    converged2 = converged1;
    converged1 = converged;
    
    IterPrev2 = IterPrev;
    IterPrev = 1; % Default
end


end

Data_W = [];
%%
for iStep = 1:size(LambdaDisp,2)

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

Lambda = LambdaDisp(1,iStep);
displacement = LambdaDisp(2:end,iStep);

%-----------
% Deflection 
%----------- 
Deflection = displacement(MiddleNode*ndof-(ndof-3));

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
Data_W(iStep,:) = [Lambda*DiscreateLoad(end)*LoadFactor,Deflection*DeflectionFactor];
% Data_W(iLoad+1,:) = [Load,Deflection*DeflectionFactor];
% Data_W(iLoad+1,:) = [Load,Deflection];

% fprintf('Sigma_xx : %g\n',Sigma_xx);
% fprintf('Normalized Sigma_xx : %g\n',Sigma_xx*StressFactor_xx);
% Data_xx(iLoad+1,:) = [Load*LoadFactor,Sigma_xx*StressFactor_xx];
% Data_xx(iLoad+1,:) = [Load,Sigma_xx*DeflectionFactor];
% Data_xx(iLoad+1,:) = [Load,Sigma_xx];
end


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
plot(Data_W(:,1),Data_W(:,2),...
    '-o','MarkerSize',15,'LineWidth',4,'color',Colors(1,:));
hold on;

Data = [
   0.10000       1.04615     
   0.17500       1.50893     
   0.25000       1.80496     
   0.36250       2.08619     
   0.53125       2.33558     
   0.70000       2.48989     
   0.85000       2.58676     
    1.0000       2.66127     
];

% Data = [
%    0.10000      0.909330     
%    0.20000       1.37647     
%    0.35000       1.76905     
%    0.57500       2.09235     
%    0.91250       2.35121     
%     1.0000       2.39613      
% ];
% 
Data(:,1) = Data(:,1)*1000;
plot(Data(:,1),Data(:,2),'-','MarkerSize',15,'LineWidth',4,'color','r');

% figure;
% plot(Data_xx(:,1),Data_xx(:,2),...
%     '-p','MarkerSize',15,'LineWidth',4,'color',Colors(1,:));
