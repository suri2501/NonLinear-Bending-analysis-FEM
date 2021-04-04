clc;
clear all;
close all;
format shortG;

folder = 'plots';
if(~exist(folder,'dir'))
    mkdir(folder);
end
%%

% import PubPlotLib.*

% Aspect Ratio
Lx = 300;
h = 3;
[ar_N,ar_D] = rat(h/Lx);
file = sprintf('Problem_NL_1_21');

figure;
fig_size = get(0,'screensize');
fig_size(3) = fig_size(3)/2;
set(gcf,'Position',fig_size);
set(gcf,'PaperPositionMode','auto');
set(gcf,'name',file,'numbertitle','off');
hold on;

% Colors = [
%       0.16,     0.44,    1.00;
%       0.93,     0.00,    0.00;
%       0.00,     0.57,    0.00;
%       0.44,     0.00,    0.99;
%       1.00,     0.50,    0.10;
%       0.75,     0.00,    0.75;
%       0.50,     0.50,    0.50;
%       0.50,     0.57,    0.00;
%       0.17,     0.17,    0.17;
%       0.00,     0.00,    0.00;
%       ];

Colors = [
      1.00,  0.00,  0.00; % light red
      0.00,  0.57,  0.00; % green
      0.25,  0.25,  0.75; % navy blue
      0.75,  0.25,  0.25; % brown
      0.75,  0.00,  0.75; % dark pink
      1.00,  0.10,  0.60; % maganta
      0.17,  0.17,  0.17; % middle black
      0.44,  0.00,  0.99; % purple
      0.99,  0.41,  0.23; % dark orange
      0.10,  0.49,  0.47; % grey
      0.00,  1.00,  0.00; % light green
      0.00,  0.75,  0.75; % cyan  
      
      
      0.34,  0.57,  0.92; % sky
      0.00,  0.00,  1.00; % light blue
      0.16,  0.44,  1.00; % blue
      0.50,  0.57,  0.00;
      0.93,  0.00,  0.00; % red
      1.00,  0.50,  0.10; % light orange
      0.00,  0.50,  0.00; % dark green
      0.25,  0.25,  0.25; % light dark
      0.00,  0.00,  0.00; % dark black
      0.54,  0.63,  0.22; % middle green
      1.00,  0.83, 	0.00; % yellow
      0.50,  0.50,  0.50; 
      0.88,  0.75,  0.73; % white
      0.66,  0.34,  0.65; % light purple
      0.76,  0.57,  0.17; 
      0.75,  0.75,  0.00; % green-yellow
    ];
  
load(fullfile(pwd,'plots','Poblem_NL_1_Linear_UDL_h_a_1_100_IHSDT.mat'));
h1 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',2.5,'Color',Colors(6,:));
set(h1,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_1_Linear_UDL_h_a_1_100_TSDT.mat'));
h2 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',2.5,'Color',Colors(10,:));
set(h2,'Marker','s','MarkerFaceColor','none','MarkerSize',16);

load(fullfile(pwd,'plots','Poblem_NL_1_vonKarman_UDL_h_a_1_100_IHSDT.mat'));
h3 = plot(Data_W(:,1),Data_W(:,2),'-.','LineWidth',2.5,'Color',Colors(11,:));
set(h3,'Marker','none','MarkerFaceColor','none','MarkerSize',20);

load(fullfile(pwd,'plots','Poblem_NL_1_vonKarman_UDL_h_a_1_100_TSDT.mat'));
h4 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',2.5,'Color',Colors(7,:));
set(h4,'Marker','.','MarkerFaceColor','none','MarkerSize',16);

load(fullfile(pwd,'plots','Poblem_NL_1_Green_UDL_h_a_1_100_IHSDT.mat'));
h5 = plot(Data_W(:,1),Data_W(:,2),'.','linewidth',2.5,'Color',Colors(1,:));
set(h5,'Marker','o','MarkerFaceColor','none','MarkerSize',20);

load(fullfile(pwd,'plots','Poblem_NL_1_Green_UDL_h_a_1_100_TSDT.mat'));
h6 = plot(Data_W(:,1),Data_W(:,2),'.','linewidth',2.5,'Color',Colors(3,:));
set(h6,'Marker','^','MarkerFaceColor','none','MarkerSize',15);


% icons(end-6).Children.MarkerSize = 20;
axis on;
grid off;
box on;

% set( gca        , ...
%     'Units'       , 'normalized',...
%     'FontName'    , 'Arial', ...
%     'FontSize'    , 20,...
%     'Box'         , 'on'     , ...
%     'Color'       , 'none',...
%     'TickLength'  , [0.02,0.02] , ...
%     'XMinorTick'  , 'on', ...
%     'YMinorTick'  , 'on', ...
%     'ZMinorTick'  , 'on', ...
%     'XMinorGrid'  , 'off', ...
%     'YMinorGrid'  , 'off', ...
%     'ZMinorGrid'  , 'off', ...
%     'XColor'      , [0,0,0], ...
%     'YColor'      , [0,0,0], ...
%     'ZColor'      , [0,0,0], ...
%     'LineWidth'   , 1.5);

set(gca,'YTick',[0, 0.5,1,1.5,2]);
set(gca,'XTick',[0,100,200,300,400]);
set(gca,'YLim',[0,2]);
set(gca,'XLim',[0,400]);
set(gca,'lineWidth',1.5);
% set(gca,'FontSize',25,'FontWeight','bold','FontName','Helvetica');
set(gca,'FontSize',20,'FontWeight','normal','FontName','Arial');
xlabel('\bf Load $\bf( \bar{P} )$',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',20);
ylabel('\bf Central Deflection $\bf( \bar{w} )$',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',20);
drawnow;

legendID = [h1(1),h2(1),h3(1),h4(1),h5(1),h6(1)];
legendString = {sprintf('FEM-IHSDT (Linear) - UDL'),sprintf('FEM-TSDT (Linear) - UDL'),...
    sprintf('FEM-IHSDT (von Karman) - UDL'),sprintf('FEM-TSDT (von Karman) - UDL'),...
    sprintf('FEM-IHSDT (Green-Lagrange) - UDL'),sprintf('FEM-TSDT (Green-Lagrange) - UDL')};

% [h_legend,icons,plots,legend_text]
h_legend = legend(legendID,legendString,'location','southeast');
set(h_legend,'FontSize',17);
% icons(1).FontSize = 15;
% icons(2).FontSize = 15;
% icons(3).FontSize = 15;
% icons(4).FontSize = 15;
% icons(5).FontSize = 15;
% icons(6).FontSize = 15;

set(gca,'Position',get(gca, 'OuterPosition') - get(gca, 'TightInset')*...
   [-1 0 1 0;0 -1 0 1; 0 0 1 0; 0 0 0 1]);
set(gca, 'Position', [0.15 0.15 0.80 0.80]);
% set(h_legend,'location','best');

% set(gcf,'renderer','opengl');
set(gcf,'renderer','painters');
% set(gcf,'PaperOrientation','portrait');
% break;
print(fullfile(pwd,'plots',get(gcf,'Name')), '-depsc2', '-r1200');
print(fullfile(pwd,'plots',get(gcf,'Name')), '-dpng', '-r100');

