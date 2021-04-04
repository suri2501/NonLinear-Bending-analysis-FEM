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
Lx = 300;                % Length of the plate (along X-axes)
h = 3;              % Total thickness i.e. height : plate thickness
[ar_N,ar_D] = rat(h/Lx);
file = sprintf('IGA_Tran_Nonlinear_SSSS2_0_90_90_0_h_By_a_%d_%d',ar_N,ar_D);

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

  


% temp = csvread(fullfile(pwd,'plots','Problem1_Exact.csv'));
% % h1 = scatter(temp(:,1),temp(:,2),350,[0 0.5 0.5],'o');
% h1 = plot(temp(:,1),temp(:,2),':o','LineWidth',8,'Color',Colors(6,:));
% set(h1,'MarkerFaceColor',Colors(6,:),'MarkerSIze',15);
% 
% temp = csvread(fullfile(pwd,'plots','Problem1_TSDT.csv'));
% h2 = scatter(temp(:,1),temp(:,2),350,[0 0.5 0.5],'s');
% set(h2,'MarkerFaceColor',Colors(7,:));

% temp = csvread(fullfile(pwd,'plots','Problem1.csv'));
% h4 = plot(temp(:,1),temp(:,2),'--','linewidth',9,'Color',Colors(2,:),...
%     'MarkerSize',20);

load(fullfile(pwd,'plots','IGA_Tran_Nonlinear_SSSS2_0_90_90_0_h_By_a_1_10.mat'));
h1 = plot(Data(:,1),Data(:,2),'-','linewidth',9,'Color',Colors(1,:));

load(fullfile(pwd,'plots','IGA_Tran_Nonlinear_SSSS2_0_90_90_0_h_By_a_1_20.mat'));
h2 = plot(Data(:,1),Data(:,2),'-','linewidth',9,'Color',Colors(2,:));

load(fullfile(pwd,'plots','IGA_Tran_Nonlinear_SSSS2_0_90_90_0_h_By_a_1_40.mat'));
h3 = plot(Data(:,1),Data(:,2),'-','linewidth',9,'Color',Colors(3,:));

temp = csvread(fullfile(pwd,'plots','SSSS2_0_90_90_0_h_a_1_10.csv'));
plot(temp(:,1),temp(:,2),':p','linewidth',9,'Color',Colors(4,:),'MarkerSize',20);

temp = csvread(fullfile(pwd,'plots','SSSS2_0_90_90_0_h_a_1_20.csv'));
plot(temp(:,1),temp(:,2),':s','linewidth',9,'Color',Colors(5,:),'MarkerSize',20);

temp = csvread(fullfile(pwd,'plots','SSSS2_0_90_90_0_h_a_1_40.csv'));
plot(temp(:,1),temp(:,2),':^','linewidth',9,'Color',Colors(6,:),'MarkerSize',20);

legendID = [h1(1),h2(1),h3(1)];
legendString = {sprintf('a/h=10'),sprintf('a/h=20'),sprintf('a/h=40')};

[h_legend,icons,plots,legend_text] = legend(legendID,legendString,'location','northwest');
set(h_legend,'FontSize',40);
icons(1).FontSize = 20;
icons(2).FontSize = 20;
icons(3).FontSize = 20;

% icons(end-4).Children.MarkerSize = 20;
% icons(end-6).Children.MarkerSize = 20;
axis on;
% grid on;
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

set(gca,'YTick',[0, 0.1,0.8]);
set(gca,'XTick',[0:50:250]);
set(gca,'YLim',[0,0.8]);
set(gca,'XLim',[0,250]);
set(gca,'lineWidth',1.5);
% set(gca,'FontSize',25,'FontWeight','bold','FontName','Helvetica');
set(gca,'FontSize',50,'FontWeight','normal','FontName','Arial');
xlabel('\bf Load $\bf( \bar{P} )$',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',50);
ylabel('\bf Central Deflection $\bf( \bar{w} )$',...
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
% print(fullfile(pwd,'plots',get(gcf,'Name')), '-depsc2', '-r1200');
% print(fullfile(pwd,'plots',get(gcf,'Name')), '-dpng', '-r100');

