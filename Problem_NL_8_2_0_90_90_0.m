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
file = sprintf('Problem_NL_8_2_0_90_90_0');

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
  

load(fullfile(pwd,'plots','Poblem_NL_8_Linear_SSL_h_a_1_10_TSDT_SSSS1_0_90_90_0.mat'));
IndexZ = IndexZ/0.1;
h1 = plot(temp_yy(:,2),IndexZ,'-','LineWidth',1.5,'Color',Colors(1,:));
set(h1,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

load(fullfile(pwd,'plots','Poblem_NL_8_vonKarman_SSL_h_a_1_10_TSDT_SSSS1_0_90_90_0.mat'));
IndexZ = IndexZ/0.1;
h2 = plot(temp_yy(:,2),IndexZ,':','LineWidth',2,'Color',Colors(2,:));
set(h2,'Marker','none','MarkerFaceColor','none','MarkerSize',17);

h3 = plot(temp_yy(:,3),IndexZ,':','LineWidth',2,'Color',Colors(3,:));
set(h3,'Marker','none','MarkerFaceColor','none','MarkerSize',17);

h4 = plot(temp_yy(:,4),IndexZ,':','LineWidth',2,'Color',Colors(4,:));
set(h4,'Marker','none','MarkerFaceColor','none','MarkerSize',17);

h5 = plot(temp_yy(:,5),IndexZ,':','LineWidth',2,'Color',Colors(5,:));
set(h5,'Marker','none','MarkerFaceColor','none','MarkerSize',17);

load(fullfile(pwd,'plots','Poblem_NL_8_Green_SSL_h_a_1_10_TSDT_SSSS1_0_90_90_0.mat'));
IndexZ = IndexZ/0.1;
h6 = plot(temp_yy(:,2),IndexZ,':','LineWidth',2,'Color',Colors(2,:));
set(h6,'Marker','.','MarkerFaceColor','none','MarkerSize',17);

h7 = plot(temp_yy(:,3),IndexZ,':','LineWidth',2,'Color',Colors(3,:));
set(h7,'Marker','.','MarkerFaceColor','none','MarkerSize',17);

h8 = plot(temp_yy(:,4),IndexZ,':','LineWidth',2,'Color',Colors(4,:));
set(h8,'Marker','.','MarkerFaceColor','none','MarkerSize',17);

h9 = plot(temp_yy(:,5),IndexZ,':','LineWidth',2,'Color',Colors(5,:));
set(h9,'Marker','.','MarkerFaceColor','none','MarkerSize',17);

% keyboard

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

set(gca,'YTick',[-0.5:0.1:0.5]);
set(gca,'YLim',[-0.5,0.5]);
set(gca,'XTick',[-0.4:0.2:0.4]);
set(gca,'XLim',[-0.4,0.4]);
set(gca,'lineWidth',1.5);
% set(gca,'FontSize',25,'FontWeight','bold','FontName','Helvetica');
set(gca,'FontSize',20,'FontWeight','normal','FontName','Arial');
xlabel('\bf $\bf \bar{\bf \sigma}_{yy} ( \bf \sigma_{yy} h^2/P_{0} a^2 )$',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',20);
ylabel('\bf $\bar{\bf z} \bf( z/h )$',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',20);
drawnow;

legendID = [h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)];
legendString = {...
    sprintf('Linear'),...
    sprintf('$\\bar{P} = 50$ (von Karman)'),...
    sprintf('$\\bar{P} = 100$ (von Karman)'),...
    sprintf('$\\bar{P} = 200$ (von Karman)'),...
    sprintf('$\\bar{P} = 300$ (von Karman)'),...
    sprintf('$\\bar{P} = 50$ (Green-Lagrange)'),...
    sprintf('$\\bar{P} = 100$ (Green-Lagrange)'),...
    sprintf('$\\bar{P} = 200$ (Green-Lagrange)'),...
    sprintf('$\\bar{P} = 300$ (Green-Lagrange)')};

% [h_legend,icons,plots,legend_text]
h_legend = legend(legendID,legendString,...
    'location','northwest','Interpreter','Latex');
set(h_legend,'FontSize',13);
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

annotation(gcf,'arrow',[0.34018 0.5630],[0.4728 0.47093],'LineWidth',2);
annotation(gcf,'textbox',[0.57 0.46 0.0371 0.0291],...
    'String',{'$\bar{P}$'},'FitBoxToText','on','Interpreter',...
    'Latex','LineStyle','none','FontSize',20);

% set(gcf,'renderer','opengl');
set(gcf,'renderer','painters');
% set(gcf,'PaperOrientation','portrait');
% break;
print(fullfile(pwd,'plots',get(gcf,'Name')), '-depsc2', '-r1200');
print(fullfile(pwd,'plots',get(gcf,'Name')), '-dpng', '-r100');

