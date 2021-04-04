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
file = sprintf('Problem_NL_10_3');

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
  

load(fullfile(pwd,'plots','Poblem_NL_10_3_Linear_UDL_h_a_1_20_IHSDT_SSFS1_AS_AnglePly_2.mat'));
h10 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(1,:));
set(h10,'Marker','o','MarkerFaceColor',Colors(1,:),'MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_3_Linear_UDL_h_a_1_20_IHSDT_SSSS1_AS_AnglePly_2.mat'));
h20 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(2,:));
set(h20,'Marker','^','MarkerFaceColor',Colors(2,:),'MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_3_Linear_UDL_h_a_1_20_IHSDT_SSFS1_AS_CrossPly_2.mat'));
h30 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(3,:));
set(h30,'Marker','s','MarkerFaceColor',Colors(3,:),'MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_3_Linear_UDL_h_a_1_20_IHSDT_SSSS1_AS_CrossPly_2.mat'));
h40 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(4,:));
set(h40,'Marker','d','MarkerFaceColor',Colors(4,:),'MarkerSize',10);




load(fullfile(pwd,'plots','Poblem_NL_10_3_vonKarman_UDL_h_a_1_20_IHSDT_SSFS1_AS_AnglePly_2.mat'));
h1 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',2,'Color',Colors(1,:));
set(h1,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_3_vonKarman_UDL_h_a_1_20_IHSDT_SSSS1_AS_AnglePly_2.mat'));
h2 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',2,'Color',Colors(2,:));
set(h2,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_3_vonKarman_UDL_h_a_1_20_IHSDT_SSFS1_AS_CrossPly_2.mat'));
h3 = plot(Data_W(:,1),Data_W(:,2),'-.','LineWidth',2,'Color',Colors(3,:));
set(h3,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_3_vonKarman_UDL_h_a_1_20_IHSDT_SSSS1_AS_CrossPly_2.mat'));
h4 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',2,'Color',Colors(4,:));
set(h4,'Marker','none','MarkerFaceColor','none','MarkerSize',10);



load(fullfile(pwd,'plots','Poblem_NL_10_3_Green_UDL_h_a_1_20_IHSDT_SSFS1_AS_AnglePly_2.mat'));
h12 = plot(Data_W(:,1),Data_W(:,2),'.','LineWidth',2,'Color',Colors(1,:));
set(h12,'Marker','o','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_3_Green_UDL_h_a_1_20_IHSDT_SSSS1_AS_AnglePly_2.mat'));
h22 = plot(Data_W(:,1),Data_W(:,2),'.','LineWidth',2,'Color',Colors(2,:));
set(h22,'Marker','^','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_3_Green_UDL_h_a_1_20_IHSDT_SSFS1_AS_CrossPly_2.mat'));
h32 = plot(Data_W(:,1),Data_W(:,2),'.','LineWidth',2,'Color',Colors(3,:));
set(h32,'Marker','s','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_3_Green_UDL_h_a_1_20_IHSDT_SSSS1_AS_CrossPly_2.mat'));
h42 = plot(Data_W(:,1),Data_W(:,2),'.','LineWidth',2,'Color',Colors(4,:));
set(h42,'Marker','d','MarkerFaceColor','none','MarkerSize',10);


% Data = [
%    0.10000E-01  0.131810     
%    0.20000E-01  0.266426     
%    0.35000E-01  0.473513     
%    0.57500E-01  0.798458     
%    0.91250E-01   1.25346     
%    0.14188       1.83705     
%    0.21781       2.47527     
%    0.31781       3.01541     
%    0.41781       3.35678     
%    0.45281       3.45017     
%    0.45894       3.46180  
% ];
Data = [
   0.10000E-01  0.130918     
   0.20000E-01  0.261581     
   0.35000E-01  0.456679     
   0.57500E-01  0.746335     
   0.91250E-01   1.15835     
   0.14188       1.71920     
   0.21781       2.38174     
   0.31781       2.95155     
   0.41781       3.31059     
   0.46781       3.45001    
];


Data(:,1) = Data(:,1)*1000;
h13 = plot(Data(1:1:end,1),Data(1:1:end,2),'.','LineWidth',2,'Color',Colors(1,:));
set(h13,'Marker','x','MarkerFaceColor','none','MarkerSize',10);

% Data = [
%    0.10000E-01  0.132091     
%    0.20000E-01  0.263871     
%    0.35000E-01  0.459978     
%    0.57500E-01  0.748484     
%    0.91250E-01   1.15077     
%    0.14188       1.68469     
%    0.21781       2.31674     
%    0.31781       2.90284     
%    0.41781       3.31289     
%    0.51781       3.60696     
%    0.61781       3.83080     
%    0.71781       4.01695     
%    0.81781       4.15519     
%    0.91781       4.27935     
%     1.0000       4.36792
%     ];
Data = [
   0.10000E-01  0.132089     
   0.20000E-01  0.263859     
   0.35000E-01  0.459923     
   0.57500E-01  0.748293     
   0.91250E-01   1.15032     
   0.14188       1.68409     
   0.21781       2.31476     
   0.31781       2.89663     
   0.41781       3.30327     
   0.51781       3.59535     
   0.61781       3.81844     
   0.71781       4.00421     
   0.81781       4.14361     
   0.91781       4.26845     
    1.0000       4.35755  
];

Data(:,1) = Data(:,1)*1000;
h33 = plot(Data(:,1),Data(:,2),'.','LineWidth',2,'Color',Colors(3,:));
set(h33,'Marker','+','MarkerFaceColor','none','MarkerSize',10);

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

% set(gca,'YTick',[0:0.5:2]);
% set(gca,'YLim',[0,2.0]);
set(gca,'XTick',[0:150:450]);
set(gca,'XLim',[0,450]);
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

legendID = [h30(1),h3(1),h32(1),h33(1),h10(1),h1(1),h12(1),h13(1),h40(1),h4(1),h42(1),h20(1),h2(1),h22(1)];
legendString = {...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSFS1 (Linear)'),...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSFS1 (von Karman)'),...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSFS1 (Green-Lagrange)'),...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSFS1 ANSYS'),...
    sprintf('\\bf $$(45^0/-45^0)_{2}$$, SSFS1 (Linear)'),...
    sprintf('\\bf $$(45^0/-45^0)_{2}$$, SSFS1 (von Karman)'),...
    sprintf('\\bf $$(45^0/-45^0)_{2}$$, SSFS1 (Green-Lagrange)'),...
    sprintf('\\bf $$(45^0/-45^0)_{2}$$, SSFS1 ANSYS'),...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSSS1 (Linear)'),...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSSS1 (von Karman)'),...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSSS (Green-Lagrange)'),...
    sprintf('\\bf $$(45^0/-45^0)_{2}$$, SSSS1 (Linear)'),...
    sprintf('\\bf $$(45^0/-45^0)_{2}$$, SSSS1 (von Karman)'),...
    sprintf('\\bf $$(45^0/-45^0)_{2}$$, SSSS1 (Green-Lagrange)')
};

% [h_legend,icons,plots,legend_text]
h_legend = legend(legendID,legendString,'location','northwest',...
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
% print(fullfile(pwd,'plots',get(gcf,'Name')), '-depsc2', '-r1200');
% print(fullfile(pwd,'plots',get(gcf,'Name')), '-dpng', '-r100');

