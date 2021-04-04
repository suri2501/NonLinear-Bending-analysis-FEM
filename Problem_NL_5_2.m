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
file = sprintf('Problem_NL_5_2');

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
  

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_TSDT_SSSS2.mat'));
h5 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(5,:));
set(h5,'Marker','*','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_TSDT_SSSS2.mat'));
h6 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',1.5,'Color',Colors(6,:));
set(h6,'Marker','*','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_IHSDT_SSSS2.mat'));
h1 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(1,:));
set(h1,'Marker','.','MarkerFaceColor','none','MarkerSize',17);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_IHSDT_SSSS2.mat'));
h2 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',1.5,'Color',Colors(2,:));
set(h2,'Marker','.','MarkerFaceColor','none','MarkerSize',17);

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_TSDT_SSFS2.mat'));
h7 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(7,:));
set(h7,'Marker','^','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_TSDT_SSFS2.mat'));
h8 = plot(Data_W(:,1),Data_W(:,2),'--','linewidth',1.5,'Color',Colors(8,:));
set(h8,'Marker','^','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_5_vonKarman_UDL_h_a_1_10_IHSDT_SSFS2.mat'));
h3 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',1.5,'Color',Colors(3,:));
set(h3,'Marker','o','MarkerFaceColor','none','MarkerSize',15);

load(fullfile(pwd,'plots','Poblem_NL_5_Green_UDL_h_a_1_10_IHSDT_SSFS2.mat'));
h4 = plot(Data_W(:,1),Data_W(:,2),'--','linewidth',1.5,'Color',Colors(4,:));
set(h4,'Marker','o','MarkerFaceColor','none','MarkerSize',15);

Data = [
   0.25000E-02  0.464952E-001
   0.50000E-02  0.923100E-001
   0.87500E-02  0.158091     
   0.14375E-01  0.247971     
   0.22812E-01  0.362359     
   0.35469E-01  0.497780     
   0.54453E-01  0.649854     
   0.79453E-01  0.797838     
   0.10445      0.912883     
   0.12945       1.00980     
   0.15445       1.09438     
   0.17945       1.16971     
   0.20445       1.23804     
   0.22945       1.30087     
   0.25445       1.35926     
   0.27945       1.41400     
   0.30445       1.46566     
   0.32945       1.51470     
   0.35445       1.56148     
   0.37945       1.60629     
   0.40445       1.64936     
   0.42945       1.69089     
   0.45445       1.73105     
   0.47945       1.76997     
   0.50445       1.80778     
   0.52945       1.84457     
   0.55445       1.88044     
   0.57945       1.91547     
   0.60445       1.94972     
   0.62945       1.98325     
   0.65445       2.01613     
   0.67945       2.04839     
   0.70445       2.08009     
   0.72945       2.11125     
   0.75445       2.14193     
   0.77945       2.17215     
   0.80445       2.20194     
   0.82945       2.23133     
   0.85445       2.26034     
   0.87945       2.28900     
   0.90445       2.31733     
   0.92945       2.34534     
   0.95445       2.37306     
   0.97945       2.40051     
    1.0000       2.42287
];
Data(:,1) = Data(:,1)*400;
Data(:,2) = Data(:,2)/(1);
h9 = plot(Data(:,1),Data(:,2),'-.','LineWidth',1.5,'Color','k');
set(h9,'Marker','none','MarkerFaceColor','none','MarkerSize',10);


Data = [
   0.25000E-02  0.872817E-001
   0.50000E-02  0.166303     
   0.87500E-02  0.265821     
   0.14375E-01  0.381128     
   0.22812E-01  0.515167     
   0.35469E-01  0.668160     
   0.54453E-01  0.842139     
   0.79453E-01   1.01824     
   0.10445       1.16134     
   0.12945       1.28209     
   0.15445       1.38872     
   0.17945       1.48494     
   0.20445       1.57306     
   0.22945       1.65478     
   0.25445       1.73129     
   0.27945       1.80350     
   0.30445       1.87207     
   0.32945       1.93753     
   0.35445       2.00032     
   0.37945       2.06077      
   0.40445       2.11916     
   0.42945       2.17573     
   0.45445       2.23068     
   0.47945       2.28417     
   0.50445       2.33635     
   0.52945       2.38735     
   0.55445       2.43727     
   0.57945       2.48622     
   0.60445       2.53427     
   0.62945       2.58150     
   0.65445       2.62797     
   0.67945       2.67376     
   0.70445       2.71891     
   0.72945       2.76347     
   0.75445       2.80748     
   0.77945       2.85099     
   0.80445       2.89403     
   0.82945       2.93664     
   0.85445       2.97884     
   0.87945       3.02067     
   0.90445       3.06215     
   0.92945       3.10331     
   0.95445       3.14416     
   0.97945       3.18473     
    1.0000       3.21788 
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

set(gca,'YTick',[0:0.5:3]);
set(gca,'YLim',[0,3]);
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
    sprintf('FEM-IHSDT (von Karman) - SSSS2'),...
    sprintf('FEM-TSDT (von Karman) - SSSS2'),...
    sprintf('FEM-IHSDT (Green-Lagrange) - SSSS2'),...
    sprintf('FEM-TSDT (Green-Lagrange) - SSSS2'),...
    sprintf('ANSYS - SSSS2'),...
    sprintf('FEM-IHSDT (von Karman) - SSFS2'),...
    sprintf('FEM-TSDT (von Karman) - SSFS2'),...
    sprintf('FEM-IHSDT (Green-Lagrange) - SSFS2'),...
    sprintf('FEM-TSDT (Green-Lagrange) - SSFS2'),...
    sprintf('ANSYS - SSFS2')};

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


