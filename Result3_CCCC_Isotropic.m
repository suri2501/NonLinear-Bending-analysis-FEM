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
file = sprintf('IGA_Tran_Nonlinear_CCCC_Isotropic_h_By_a_%d_%d',ar_N,ar_D);

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

temp = csvread(fullfile(pwd,'plots','CCCC_Isotropic_Linear.csv'));
% h1 = scatter(temp(:,1),temp(:,2),350,[0 0.5 0.5],'o');
h1 = plot(temp(:,1),temp(:,2),':o','LineWidth',8,'Color',Colors(3,:));
set(h1,'MarkerFaceColor',Colors(3,:),'MarkerSIze',15);

load(fullfile(pwd,'plots','IGA_Tran_Nonlinear_CCCC_Isotropic_h_By_a_1_100.mat'));
h4 = plot(Data(:,1),Data(:,2),'-','linewidth',9,'Color',Colors(2,:));

temp = csvread(fullfile(pwd,'plots','CCCC_Isotropic_MIXFEM_FEMQ9_Tran.csv'));
h3 = plot(temp(:,1),temp(:,2),':p','linewidth',9,'Color',Colors(1,:),...
    'MarkerSize',20);

temp = csvread(fullfile(pwd,'plots','CCCC_Isotropic_Exact.csv'));
% h2 = scatter(temp(:,1),temp(:,2),350,[0 0.5 0.5],'s');
% set(h2,'MarkerFaceColor',Colors(6,:));
h2 = plot(temp(:,1),temp(:,2),':^','LineWidth',8,'Color',Colors(6,:));
set(h1,'MarkerFaceColor',Colors(6,:),'MarkerSIze',15);

% load(fullfile(pwd,'plots','IGA_IHSDT_Nonlinear_Bending_h_By_a_1_100.mat'));
% h5 = plot(Data(:,1),Data(:,2),'-','linewidth',9,'Color',Colors(10,:));
% 
% load(fullfile(pwd,'plots','Problem_IHSDT.mat'));
% plot(Data(:,1),Data(:,2),':','linewidth',9,'Color',Colors(4,:));
% 
% load(fullfile(pwd,'plots','Problem_IHSDT_babu.mat'));
% plot(-store(:,1),store(:,2),':','linewidth',9,'Color','r');
% 
% load(fullfile(pwd,'plots','IGA_suri.mat'));
% plot(Data(:,1),Data(:,2),':','linewidth',9,'Color','b');


% h3 = plot(temp(:,1),temp(:,2),':','linewidth',9,'Color',Colors(3,:));

% temp = csvread(fullfile(pwd,'plots','FST_New.csv'));
% h4 = scatter(temp(:,1),temp(:,2),250,[0 0.5 0.5],'s');
% set(h4,'LineWidth',0.6,'MarkerFaceColor',Colors(4,:));
% h4 = plot(temp(:,1),temp(:,2),'.','linewidth',7,'Color',Colors(4,:),...
%     'MarkerSize',25);

legendID = [h1(1),h2(1),h3(1),h4(1)];
legendString = {sprintf('Linear'),sprintf('Exact'),sprintf('Tran'),sprintf('Present')};

[h_legend,icons,plots,legend_text] = legend(legendID,legendString,'location','southeast');
set(h_legend,'FontSize',30);
icons(1).FontSize = 20;
icons(2).FontSize = 20;
icons(3).FontSize = 20;
icons(4).FontSize = 20;
% icons(5).FontSize = 20;

% icons(end-4).Children.MarkerSize = 20;
% icons(end-6).Children.MarkerSize = 20;
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

set(gca,'YTick',[0, 0.5,1,1.5,2]);
set(gca,'XTick',[0,100,200,300,400]);
set(gca,'YLim',[0,2]);
set(gca,'XLim',[0,400]);
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
set(h_legend,'location','best');

% set(gcf,'renderer','opengl');
set(gcf,'renderer','painters');
% set(gcf,'PaperOrientation','portrait');
% break;
print(fullfile(pwd,'plots',get(gcf,'Name')), '-depsc2', '-r1200');
print(fullfile(pwd,'plots',get(gcf,'Name')), '-dpng', '-r100');