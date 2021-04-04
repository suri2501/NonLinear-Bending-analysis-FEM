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
file = sprintf('Problem_NL_5_0');

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
  

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_TSDT_CCCC.mat'));
h5 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(5,:));
set(h5,'Marker','*','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_TSDT_CCCC.mat'));
h6 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',1.5,'Color',Colors(6,:));
set(h6,'Marker','*','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_IHSDT_CCCC.mat'));
h1 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(1,:));
set(h1,'Marker','.','MarkerFaceColor','none','MarkerSize',17);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_IHSDT_CCCC.mat'));
h2 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',1.5,'Color',Colors(2,:));
set(h2,'Marker','.','MarkerFaceColor','none','MarkerSize',17);

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_TSDT_CCFC4.mat'));
h7 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(7,:));
set(h7,'Marker','^','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_TSDT_CCFC4.mat'));
h8 = plot(Data_W(:,1),Data_W(:,2),'--','linewidth',1.5,'Color',Colors(8,:));
set(h8,'Marker','^','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_IHSDT_CCFC4.mat'));
h3 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(3,:));
set(h3,'Marker','o','MarkerFaceColor','none','MarkerSize',15);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_IHSDT_CCFC4.mat'));
h4 = plot(Data_W(:,1),Data_W(:,2),'--','linewidth',1.5,'Color',Colors(4,:));
set(h4,'Marker','o','MarkerFaceColor','none','MarkerSize',15);

Data = [
   0.25000E-02  0.134788E-001
   0.50000E-02  0.328092E-001
   0.87500E-02  0.573565E-001
   0.14375E-01  0.939789E-001
   0.22812E-01  0.148222     
   0.35469E-01  0.227299     
   0.54453E-01  0.339096     
   0.79453E-01  0.472180     
   0.10445      0.589876     
   0.12945      0.694319     
   0.15445      0.787858     
   0.17945      0.872509     
   0.20445      0.949885     
   0.22945       1.02125     
   0.25445       1.08758     
   0.27945       1.14967     
   0.30445       1.20812     
   0.32945       1.26343     
   0.35445       1.31600     
   0.37945       1.36618     
   0.40445       1.41423     
   0.42945       1.46039     
   0.45445       1.50486     
   0.47945       1.54781     
   0.50445       1.58938     
   0.52945       1.62969     
   0.55445       1.66886     
   0.57945       1.70699     
   0.60445       1.74416     
   0.62945       1.78045     
   0.65445       1.81592     
   0.67945       1.85063     
   0.70445       1.88464     
   0.72945       1.91800     
   0.75445       1.95075     
   0.77945       1.98293     
   0.80445       2.01459     
   0.82945       2.04574     
   0.85445       2.07643     
   0.87945       2.10668     
   0.90445       2.13652     
   0.92945       2.16597     
   0.95445       2.19506     
   0.97945       2.22380     
    1.0000       2.24727 
];
Data(:,1) = Data(:,1)*400;
Data(:,2) = Data(:,2)/(1);
h9 = plot(Data(:,1),Data(:,2),'-.','LineWidth',1.5,'Color','k');
set(h9,'Marker','none','MarkerFaceColor','none','MarkerSize',10);


Data = [
   0.25000E-02  0.235012E-001
   0.50000E-02  0.469653E-001
   0.87500E-02  0.819454E-001
   0.14375E-01  0.133640     
   0.22812E-01  0.208645     
   0.35469E-01  0.313903     
   0.54453E-01  0.454753     
   0.79453E-01  0.613287     
   0.10445      0.748232     
   0.12945      0.866271     
   0.15445      0.971373     
   0.17945       1.06644     
   0.20445       1.15353     
   0.22945       1.23413     
   0.25445       1.30937     
   0.27945       1.38010     
   0.30445       1.44698     
   0.32945       1.51055     
   0.35445       1.57123     
   0.37945       1.62938     
   0.40445       1.68530     
   0.42945       1.73922     
   0.45445       1.79135     
   0.47945       1.84188     
   0.50445       1.89095     
   0.52945       1.93871     
   0.55445       1.98527     
   0.57945       2.03072     
   0.60445       2.07516     
   0.62945       2.11868     
   0.65445       2.16134     
   0.67945       2.20320     
   0.70445       2.24433     
   0.72945       2.28478     
   0.75445       2.32460     
   0.77945       2.36382     
   0.80445       2.40249     
   0.82945       2.44065     
   0.85445       2.47834     
   0.87945       2.51557      
   0.90445       2.55238     
   0.92945       2.58879     
   0.95445       2.62484     
   0.97945       2.66054     
    1.0000       2.68974     
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

set(gca,'YTick',[0:0.5:4]);
set(gca,'YLim',[0,4]);
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
    h10(1)
    ];
legendString = {...
    sprintf('FEM-IHSDT (von Karman) - CCCC'),...
    sprintf('FEM-TSDT (von Karman) - CCCC'),...
    sprintf('FEM-IHSDT (Green-Lagrange) - CCCC'),...
    sprintf('FEM-TSDT (Green-Lagrange) - CCCC'),...
    sprintf('ANSYS - CCCC'),...
    sprintf('FEM-IHSDT (von Karman) - CCFC'),...
    sprintf('FEM-TSDT (von Karman) - CCFC'),...
    sprintf('FEM-IHSDT (Green-Lagrange) - CCFC'),...
    sprintf('FEM-TSDT (Green-Lagrange) - CCFC'),...
        sprintf('ANSYS - CCFC')};

% [h_legend,icons,plots,legend_text]
h_legend = legend(legendID,legendString,...
    'location','northwest');
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

