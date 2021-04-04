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
file = sprintf('Problem_NL_5_4');

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
  

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_TSDT_SSSS4.mat'));
h5 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(5,:));
set(h5,'Marker','*','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_TSDT_SSSS4.mat'));
h6 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',1.5,'Color',Colors(6,:));
set(h6,'Marker','*','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_IHSDT_SSSS4.mat'));
h1 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(1,:));
set(h1,'Marker','.','MarkerFaceColor','none','MarkerSize',17);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_IHSDT_SSSS4.mat'));
h2 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',1.5,'Color',Colors(2,:));
set(h2,'Marker','.','MarkerFaceColor','none','MarkerSize',17);

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_TSDT_SSFS4.mat'));
h7 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(7,:));
set(h7,'Marker','^','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_TSDT_SSFS4.mat'));
h8 = plot(Data_W(:,1),Data_W(:,2),'--','linewidth',1.5,'Color',Colors(8,:));
set(h8,'Marker','^','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_IHSDT_SSFS4.mat'));
h3 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(3,:));
set(h3,'Marker','o','MarkerFaceColor','none','MarkerSize',15);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_IHSDT_SSFS4.mat'));
h4 = plot(Data_W(:,1),Data_W(:,2),'--','linewidth',1.5,'Color',Colors(4,:));
set(h4,'Marker','o','MarkerFaceColor','none','MarkerSize',15);

Data = [
   0.25000E-02  0.494185E-001
   0.50000E-02  0.978282E-001
   0.87500E-02  0.166832     
   0.14375E-01  0.259686     
   0.22812E-01  0.375391     
   0.35469E-01  0.509756     
   0.54453E-01  0.659280     
   0.79453E-01  0.805749     
   0.10445      0.920963     
   0.12945       1.01735     
   0.15445       1.10111     
   0.17945       1.17578     
   0.20445       1.24356     
   0.22945       1.30594     
   0.25445       1.36395     
   0.27945       1.41837     
   0.30445       1.46977     
   0.32945       1.51858     
   0.35445       1.56517     
   0.37945       1.60981     
   0.40445       1.65274     
   0.42945       1.69415     
   0.45445       1.73421     
   0.47945       1.77305     
   0.50445       1.81079     
   0.52945       1.84752     
   0.55445       1.88334     
   0.57945       1.91833     
   0.60445       1.95256     
   0.62945       1.98608     
   0.65445       2.01894     
   0.67945       2.05120     
   0.70445       2.08289     
   0.72945       2.11407     
   0.75445       2.14476     
   0.77945       2.17499     
   0.80445       2.20480     
   0.82945       2.23422     
   0.85445       2.26326     
   0.87945       2.29195     
   0.90445       2.32031     
   0.92945       2.34836     
   0.95445       2.37612     
   0.97945       2.40361     
    1.0000       2.42601  
];
Data(:,1) = Data(:,1)*400;
Data(:,2) = Data(:,2)/(1);
h9 = plot(Data(:,1),Data(:,2),'-.','LineWidth',1.5,'Color','k');
set(h9,'Marker','none','MarkerFaceColor','none','MarkerSize',10);


Data = [
   0.25000E-02  0.901443E-001
   0.50000E-02  0.169972     
   0.87500E-02  0.267911     
   0.14375E-01  0.381027     
   0.22812E-01  0.508516     
   0.35469E-01  0.651172     
   0.54453E-01  0.810591     
   0.79453E-01  0.969896     
   0.10445       1.09763     
   0.12945       1.20604     
   0.15445       1.30128     
   0.17945       1.38695     
   0.20445       1.46529     
   0.22945       1.53786     
   0.25445       1.60573     
   0.27945       1.66970     
   0.30445       1.73040     
   0.32945       1.78830     
   0.35445       1.84376     
   0.37945       1.89711     
   0.40445       1.94859     
   0.42945       1.99841     
   0.45445       2.04675     
   0.47945       2.09376     
   0.50445       2.13957     
   0.52945       2.18428     
   0.55445       2.22800     
   0.57945       2.27082     
   0.60445       2.31280     
   0.62945       2.35402     
   0.65445       2.39454     
   0.67945       2.43440     
   0.70445       2.47366     
   0.72945       2.51237     
   0.75445       2.55055     
   0.77945       2.58826     
   0.80445       2.62552     
   0.82945       2.66236     
   0.85445       2.69881     
   0.87945       2.73490     
   0.90445       2.77065     
   0.92945       2.80608     
   0.95445       2.84122     
   0.97945       2.87608     
    1.0000       2.90454     
];
Data(:,1) = Data(:,1)*400;
Data(:,2) = Data(:,2)/(1);
h10 = plot(Data(:,1),Data(:,2),'--','LineWidth',1.5,'Color','k');
set(h10,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

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

set(gca,'YTick',[0:0.5:2.5]);
set(gca,'YLim',[0,2.5]);
set(gca,'XTick',[0:100:400]);
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

legendID = [h1(1),h5(1),h2(1),h6(1),h9(1),h3(1),h7(1),h4(1),h8(1),h10(1)];
legendString = {...
    sprintf('FEM-IHSDT (von Karman) - SSSS4'),...
    sprintf('FEM-TSDT (von Karman) - SSSS4'),...
    sprintf('FEM-IHSDT (Green-Lagrange) - SSSS4'),...
    sprintf('FEM-TSDT (Green-Lagrange) - SSSS4'),...
    sprintf('ANSYS - SSSS4'),...
    sprintf('FEM-IHSDT (von Karman) - SSFS4'),...
    sprintf('FEM-TSDT (von Karman) - SSFS4'),...
    sprintf('FEM-IHSDT (Green-Lagrange) - SSFS4'),...
    sprintf('FEM-TSDT (Green-Lagrange) - SSFS4'),...
    sprintf('ANSYS - SSFS4')};

% [h_legend,icons,plots,legend_text]
h_legend = legend(legendID,legendString,'location','southeast');
set(h_legend,'FontSize',14);
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

