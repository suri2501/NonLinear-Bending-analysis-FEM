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
Lx = 12;                % Length of the plate (along X-axes)
h = 0.138;              % Total thickness i.e. height : plate thickness
[ar_N,ar_D] = rat(h/Lx);
file = sprintf('IGA_TSDT_Nonlinear_Bending_h_By_a_%d_%d',ar_N,ar_D);

figure;
fig_size = get(0,'screensize');
fig_size(3) = fig_size(3)/1;
set(gcf,'Position',fig_size);
set(gcf,'PaperPositionMode','auto');
set(gcf,'name',file,'numbertitle','off');
hold on;

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

  
load(fullfile(pwd,'plots','IGA_TSDT_Nonlinear_Bending_h_By_a_23_2000.mat'));
h1 = plot(Data(:,1),Data(:,2),'-','linewidth',9,'Color',Colors(1,:));

temp = csvread(fullfile(pwd,'plots','TSDT.csv'));
h2 = scatter(temp(:,1),temp(:,2),250,[0 0.5 0.5],'o');
set(h2,'MarkerFaceColor',Colors(2,:));

% h3 = plot(temp(:,1),temp(:,2),':','linewidth',9,'Color',Colors(3,:));

% temp = csvread(fullfile(pwd,'plots','FST_New.csv'));
% h4 = scatter(temp(:,1),temp(:,2),250,[0 0.5 0.5],'s');
% set(h4,'LineWidth',0.6,'MarkerFaceColor',Colors(4,:));
% h4 = plot(temp(:,1),temp(:,2),'.','linewidth',7,'Color',Colors(4,:),...
%     'MarkerSize',25);

legendID = [h1(1),h2(1)];
legendString = {sprintf('Present IGA'),sprintf('FEM TSDT')};

[h_legend,icons,plots,legend_text] = legend(legendID,legendString,'location','northwest');
set(h_legend,'FontSize',30);
icons(1).FontSize = 20;
icons(2).FontSize = 20;

icons(end).Children.MarkerSize = 20;
axis on;
grid on;
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

set(gca,'YTick',[0, 0.05, 0.10, 0.15, 0.20,0.25]);
set(gca,'XTick',[0,0.5,1.0,1.5,2]);
set(gca,'YLim',[0,0.25]);
set(gca,'XLim',[0,2]);

% set(gca,'FontSize',25,'FontWeight','bold','FontName','Helvetica');
set(gca,'FontSize',50,'FontWeight','normal','FontName','Arial');
xlabel('\bf Load $\bf( P )$',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',50);
ylabel('\bf Central Deflection $\bf( w )$',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',50);
drawnow;

set(gca,'Position',get(gca, 'OuterPosition') - get(gca, 'TightInset')*...
   [-1 0 1 0;0 -1 0 1; 0 0 1 0; 0 0 0 1]);
set(gca, 'Position', [0.30 0.20 0.50 0.75]);


% set(gcf,'renderer','opengl');
set(gcf,'renderer','painters');
% set(gcf,'PaperOrientation','portrait');
% break;
print(fullfile(pwd,'plots',get(gcf,'Name')), '-depsc2', '-r800');
print(fullfile(pwd,'plots',get(gcf,'Name')), '-dpng', '-r800');
% print(fullfile(pwd,'plots',get(gcf,'Name')), '-djpeg', '-r800');

% saveas(gcf,fullfile(pwd,'plots',get(gcf,'Name')),'jpg');
% saveas(gcf,fullfile(pwd,'plots',get(gcf,'Name')),'jpeg');
% saveas(gcf,fullfile(pwd,'plots',get(gcf,'Name')),'png');
% saveas(gcf,fullfile(pwd,'plots',get(gcf,'Name')),'epsc');

break;
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
% 
% set(gca,'YTick',[-0.5,0,2,4,6]);
% set(gca,'XTick',[0,1E-3,2E-3]);
% set(gca,'YLim',[-0.5,6]);
% set(gca,'XLim',[0,2E-3]);
% 
% 
% % change settings
% opt = [];
% opt.XLabel = 'Time (sec)';   % xlabel
% opt.YLabel = 'Central Deflection'; % ylabel
% opt.Title = ''; % title
% opt.Colors = [0, 0, 0];   % [red, green, blue]
% opt.LineWidth = 2;        % line width
% opt.LineStyle = {'--'};   % line style: '-', ':', '--' etc
% 
% opt.YLim = [-2E0, 6E0]; % [min, max]
% opt.YTick = [-2E0, 0E0, 2E0, 4E0 6E0]; %[tick1, tick2, .. ]
% opt.YGrid = 'on';       % 'on' or 'off'
% 
% opt.Legend = {'hello'}; % legends
% 
% opt.BoxDim = [fig_size(3),fig_size(4)];
% 
% opt.FileName = 'hello.png';
% setPlotProp(opt);
% break;
