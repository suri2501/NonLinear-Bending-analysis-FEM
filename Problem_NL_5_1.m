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
file = sprintf('Problem_NL_5_1');

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
  

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_TSDT_SSSS1.mat'));
h5 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(5,:));
set(h5,'Marker','*','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_TSDT_SSSS1.mat'));
h6 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',1.5,'Color',Colors(6,:));
set(h6,'Marker','*','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_IHSDT_SSSS1.mat'));
h1 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(1,:));
set(h1,'Marker','.','MarkerFaceColor','none','MarkerSize',17);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_IHSDT_SSSS1.mat'));
h2 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',1.5,'Color',Colors(2,:));
set(h2,'Marker','.','MarkerFaceColor','none','MarkerSize',17);

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_TSDT_SSFS1.mat'));
h7 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(7,:));
set(h7,'Marker','^','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_TSDT_SSFS1.mat'));
h8 = plot(Data_W(:,1),Data_W(:,2),'--','linewidth',1.5,'Color',Colors(8,:));
set(h8,'Marker','^','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_IHSDT_SSFS1.mat'));
h3 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(3,:));
set(h3,'Marker','o','MarkerFaceColor','none','MarkerSize',15);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_IHSDT_SSFS1.mat'));
h4 = plot(Data_W(:,1),Data_W(:,2),'--','linewidth',1.5,'Color',Colors(4,:));
set(h4,'Marker','o','MarkerFaceColor','none','MarkerSize',15);

Data = [
   0.25000E-02  0.464896E-001
   0.50000E-02  0.929704E-001
   0.87500E-02  0.161361     
   0.14375E-01  0.259902     
   0.22812E-01  0.395950     
   0.35469E-01  0.572225     
   0.54453E-01  0.784662     
   0.79453E-01  0.990707     
   0.10445       1.15691     
   0.12945       1.29168     
   0.15445       1.40650     
   0.17945       1.50680     
   0.20445       1.59576     
   0.22945       1.67569     
   0.25445       1.74826     
   0.27945       1.81474     
   0.30445       1.87606     
   0.32945       1.93298     
   0.35445       1.98609     
   0.37945       2.03587     
   0.40445       2.08273     
   0.42945       2.12700     
   0.45445       2.16897     
   0.47945       2.20886     
   0.50445       2.24690     
   0.52945       2.28325     
   0.55445       2.31809     
   0.57945       2.35154     
   0.60445       2.38373     
   0.62945       2.41476     
   0.65445       2.44474     
   0.67945       2.47375     
   0.70445       2.50186     
   0.72945       2.52916     
   0.75445       2.55569     
   0.77945       2.58152     
   0.80445       2.60671     
   0.82945       2.63129     
   0.85445       2.65532     
   0.87945       2.67883     
   0.90445       2.70186     
   0.92945       2.72445     
   0.95445       2.74662     
   0.97945       2.76840     
    1.0000       2.78604 
];
Data(:,1) = Data(:,1)*400;
Data(:,2) = Data(:,2)/(1);
h9 = plot(Data(:,1),Data(:,2),'-.','LineWidth',1.5,'Color','k');
set(h9,'Marker','none','MarkerFaceColor','none','MarkerSize',10);


Data = [
   0.25000E-02  0.889327E-001
   0.50000E-02  0.177602     
   0.87500E-02  0.308515     
   0.14375E-01  0.497949     
   0.22812E-01  0.754430     
   0.35469E-01   1.07038     
   0.54453E-01   1.40408     
   0.79453E-01   1.68546     
   0.10445       1.87384     
   0.12945       2.01247     
   0.15445       2.12155     
   0.17945       2.21072     
   0.20445       2.28639     
   0.22945       2.35201     
   0.25445       2.41001     
   0.27945       2.46203     
   0.30445       2.50927     
   0.32945       2.55261     
   0.35445       2.59271     
   0.37945       2.63010     
   0.40445       2.66518     
   0.42945       2.69830     
   0.45445       2.72971     
   0.47945       2.75965     
   0.50445       2.78830     
   0.52945       2.81582     
   0.55445       2.84235     
   0.57945       2.86800     
   0.60445       2.89286     
   0.62945       2.91704     
   0.65445       2.94060     
   0.67945       2.96362     
   0.70445       2.98614     
   0.72945       3.00824     
   0.75445       3.02995     
   0.77945       3.05132     
   0.80445       3.07238     
   0.82945       3.09319     
   0.85445       3.11375     
   0.87945       3.13412     
   0.90445       3.15431     
   0.92945       3.17436     
   0.95445       3.19428     
   0.97945       3.21410     
    1.0000       3.23033  
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

set(gca,'YTick',[0:0.5:3.5]);
set(gca,'YLim',[0,3.5]);
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

legendID = [...
    h1(1),...
    h5(1),...
    h2(1),...
    h6(1),...
    h9(1),...
    h3(1),...
    h7(1),...
    h4(1),...
    h8(1),...
    h10(1)];
legendString = {...
    sprintf('FEM-IHSDT (von Karman) - SSSS1'),...
    sprintf('FEM-TSDT (von Karman) - SSSS1'),...
    sprintf('FEM-IHSDT (Green-Lagrange) - SSSS1'),...
    sprintf('FEM-TSDT (Green-Lagrange) - SSSS1'),...
    sprintf('ANSYS - SSSS1'),...
    sprintf('FEM-IHSDT (von Karman) - SSFS1'),...
    sprintf('FEM-TSDT (von Karman) - SSFS1'),...
    sprintf('FEM-IHSDT (Green-Lagrange) - SSFS1'),...
    sprintf('FEM-TSDT (Green-Lagrange) - SSFS1'),...
    sprintf('ANSYS - SSFS1')};

% [h_legend,icons,plots,legend_text]
h_legend = legend(legendID,legendString,...
    'location','southeast');
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

