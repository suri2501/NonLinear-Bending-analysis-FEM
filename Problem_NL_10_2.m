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
file = sprintf('Problem_NL_10_2');

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
  

load(fullfile(pwd,'plots','Poblem_NL_10_2_Linear_UDL_h_a_1_20_IHSDT_SSFS1_0_90_2.mat'));
h10 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(1,:));
set(h10,'Marker','o','MarkerFaceColor',Colors(1,:),'MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_2_Linear_UDL_h_a_1_20_IHSDT_SSSS1_0_90_2.mat'));
h20 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(2,:));
set(h20,'Marker','^','MarkerFaceColor',Colors(2,:),'MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_2_Linear_UDL_h_a_1_20_IHSDT_SSFS1_0_90_4.mat'));
h30 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(3,:));
set(h30,'Marker','s','MarkerFaceColor',Colors(3,:),'MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_2_Linear_UDL_h_a_1_20_IHSDT_SSSS1_0_90_4.mat'));
h40 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(4,:));
set(h40,'Marker','d','MarkerFaceColor',Colors(4,:),'MarkerSize',10);




load(fullfile(pwd,'plots','Poblem_NL_10_2_vonKarman_UDL_h_a_1_20_IHSDT_SSFS1_0_90_2.mat'));
h1 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',1.5,'Color',Colors(1,:));
set(h1,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_2_vonKarman_UDL_h_a_1_20_IHSDT_SSSS1_0_90_2.mat'));
h2 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',1.5,'Color',Colors(2,:));
set(h2,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_2_vonKarman_UDL_h_a_1_20_IHSDT_SSFS1_0_90_4.mat'));
h3 = plot(Data_W(:,1),Data_W(:,2),'-.','LineWidth',1.5,'Color',Colors(3,:));
set(h3,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_2_vonKarman_UDL_h_a_1_20_IHSDT_SSSS1_0_90_4.mat'));
h4 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(4,:));
set(h4,'Marker','none','MarkerFaceColor','none','MarkerSize',10);



load(fullfile(pwd,'plots','Poblem_NL_10_2_Green_UDL_h_a_1_20_IHSDT_SSFS1_0_90_2.mat'));
h12 = plot(Data_W(:,1),Data_W(:,2),'.','LineWidth',2,'Color',Colors(1,:));
set(h12,'Marker','o','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_2_Green_UDL_h_a_1_20_IHSDT_SSSS1_0_90_2.mat'));
h22 = plot(Data_W(:,1),Data_W(:,2),'.','LineWidth',2,'Color',Colors(2,:));
set(h22,'Marker','^','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_2_Green_UDL_h_a_1_20_IHSDT_SSFS1_0_90_4.mat'));
h32 = plot(Data_W(:,1),Data_W(:,2),'.','LineWidth',2,'Color',Colors(3,:));
set(h32,'Marker','s','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_10_2_Green_UDL_h_a_1_20_IHSDT_SSSS1_0_90_4.mat'));
h42 = plot(Data_W(:,1),Data_W(:,2),'.','LineWidth',2,'Color',Colors(4,:));
set(h42,'Marker','d','MarkerFaceColor','none','MarkerSize',10);


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
Data(:,1) = Data(:,1)*1000;
h13 = plot(Data(1:4:end,1),Data(1:4:end,2),'.','LineWidth',2,'Color',Colors(7,:));
set(h13,'Marker','*','MarkerFaceColor','none','MarkerSize',10);

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
set(gca,'XTick',[0:100:500]);
set(gca,'XLim',[0,500]);
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

legendID = [h10(1),h1(1),h12(1),h13(1),...
    h30(1),h3(1),h32(1),...
    h20(1),h2(1),h22(1),...
    h40(1),h4(1),h42(1)];
legendString = {...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSFS1 (Linear)'),...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSFS1 (von Karman)'),...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSFS1 (Green-Lagrange)'),...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSFS1 ANSYS'),...
    sprintf('\\bf $$(0^0/90^0)_{4}$$, SSFS1 (Linear)'),...
    sprintf('\\bf $$(0^0/90^0)_{4}$$, SSFS1 (von Karman)'),...
    sprintf('\\bf $$(0^0/90^0)_{4}$$, SSFS1 (Green-Lagrange)'),...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSSS1 (Linear)'),...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSSS1 (von Karman)'),...
    sprintf('\\bf $$(0^0/90^0)_{2}$$, SSSS1 (Green-Lagrange)'),...
    sprintf('\\bf $$(0^0/90^0)_{4}$$, SSSS1 (Linear)'),...
    sprintf('\\bf $$(0^0/90^0)_{4}$$, SSSS1 (von Karman)'),...
    sprintf('\\bf $$(0^0/90^0)_{4}$$, SSSS1 (Green-Lagrange)'),...
    };

% [h_legend,icons,plots,legend_text]
h_legend = legend(legendID,legendString,'location','northwest',...
    'Interpreter','Latex');
set(h_legend,'FontSize',12,'NumColumns',1);

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

