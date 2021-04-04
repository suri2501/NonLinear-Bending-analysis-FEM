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
Lx = 10;
h = 1;
[ar_N,ar_D] = rat(h/Lx);
file = sprintf('Problem_NL_10_1');

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
  

load(fullfile(pwd,'plots','Poblem_NL_10_1_Linear_UDL_h_a_1_4_IHSDT_SSFS1.mat'));
h10 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(1,:));
set(h10,'Marker','o','MarkerFaceColor',Colors(1,:),'MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_1_Linear_UDL_h_a_1_4_IHSDT_SSSS1.mat'));
h20 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(2,:));
set(h20,'Marker','^','MarkerFaceColor',Colors(2,:),'MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_1_Linear_UDL_h_a_1_50_IHSDT_SSFS1.mat'));
h30 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(3,:));
set(h30,'Marker','s','MarkerFaceColor',Colors(3,:),'MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_1_Linear_UDL_h_a_1_50_IHSDT_SSSS1.mat'));
h40 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(4,:));
set(h40,'Marker','d','MarkerFaceColor',Colors(4,:),'MarkerSize',10);




load(fullfile(pwd,'plots','Poblem_NL_10_1_vonKarman_UDL_h_a_1_4_IHSDT_SSFS1.mat'));
h1 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(1,:));
set(h1,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_1_vonKarman_UDL_h_a_1_4_IHSDT_SSSS1.mat'));
h2 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',1.5,'Color',Colors(2,:));
set(h2,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_1_vonKarman_UDL_h_a_1_50_IHSDT_SSFS1.mat'));
h3 = plot(Data_W(:,1),Data_W(:,2),'-.','LineWidth',1.5,'Color',Colors(3,:));
set(h3,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_1_vonKarman_UDL_h_a_1_50_IHSDT_SSSS1.mat'));
h4 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(4,:));
set(h4,'Marker','none','MarkerFaceColor','none','MarkerSize',10);



load(fullfile(pwd,'plots','Poblem_NL_10_1_Green_UDL_h_a_1_4_IHSDT_SSFS1.mat'));
h12 = plot(Data_W(:,1),Data_W(:,2),'.','LineWidth',2,'Color',Colors(1,:));
set(h12,'Marker','o','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_1_Green_UDL_h_a_1_4_IHSDT_SSSS1.mat'));
h22 = plot(Data_W(:,1),Data_W(:,2),'.','LineWidth',2,'Color',Colors(2,:));
set(h22,'Marker','^','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_1_Green_UDL_h_a_1_50_IHSDT_SSFS1.mat'));
h32 = plot(Data_W(:,1),Data_W(:,2),'.','LineWidth',2,'Color',Colors(3,:));
set(h32,'Marker','s','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_1_Green_UDL_h_a_1_50_IHSDT_SSSS1.mat'));
h42 = plot(Data_W(:,1),Data_W(:,2),'.','LineWidth',2,'Color',Colors(4,:));
set(h42,'Marker','d','MarkerFaceColor','none','MarkerSize',10);


Data = [
   0.10000E-01  0.713604E-001
   0.20000E-01  0.142600     
   0.35000E-01  0.249026     
   0.57500E-01  0.407171     
   0.91250E-01  0.639886     
   0.14188      0.977577     
   0.21781       1.46077     
   0.31781       2.06072     
   0.41781       2.58026     
   0.51781       3.09991     
   0.61781       3.60434     
   0.71781       4.02635     
   0.81781       4.44211     
   0.91781       4.84337     
    1.0000       5.15095    
];
Data(:,1) = Data(:,1)*1000;
h33 = plot(Data(:,1),Data(:,2),'.','LineWidth',2,'Color',Colors(7,:));
set(h33,'Marker','*','MarkerFaceColor','none','MarkerSize',10);

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

set(gca,'YTick',[0:1:4]);
set(gca,'YLim',[0,5]);
set(gca,'XTick',[0:100:400]);
set(gca,'XLim',[0,400]);
set(gca,'lineWidth',1.5);
% set(gca,'FontSize',25,'FontWeight','bold','FontName','Helvetica');
set(gca,'FontSize',20,'FontWeight','normal','FontName','Arial');
xlabel('\bf Load $\bf (\bar{P}) $',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',20);
ylabel('\bf Central Deflection $\bf (\bar{w})$',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',20);
drawnow;

legendID = [h10(1),h1(1),h12(1),...
    h20(1),h2(1),h22(1),...
    h30(1),h3(1),h32(1),h33(1),...
    h40(1),h4(1),h42(1)];
legendString = {
    sprintf('\\bf a/h = 4, SSFS1 (Linear)'),...
    sprintf('\\bf a/h = 4, SSFS1 (von Karman)'),...
    sprintf('\\bf a/h = 4, SSFS1 (Green-Lagrange)'),...
    sprintf('\\bf a/h = 4, SSSS1 (Linear)'),...
    sprintf('\\bf a/h = 4, SSSS1 (von Karman)'),...
    sprintf('\\bf a/h = 4, SSSS1 (Green-Lagrange)'),...
    sprintf('\\bf a/h = 50, SSFS1 (Linear)'),...
    sprintf('\\bf a/h = 50, SSFS1 (von Karman)'),...
    sprintf('\\bf a/h = 50, SSFS1 (Green-Lagrange)'),...
    sprintf('\\bf a/h = 50, SSFS1 ANSYS'),...
    sprintf('\\bf a/h = 50, SSSS1 (Linear)'),...
    sprintf('\\bf a/h = 50, SSSS1 (von Karman)'),...
    sprintf('\\bf a/h = 50, SSSS1 (Green-Lagrange)')
    };

% [h_legend,icons,plots,legend_text]
h_legend = legend(legendID,legendString,'location','north',...
    'Interpreter','Latex');
set(h_legend,'FontSize',11,'NumColumns',1);

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

