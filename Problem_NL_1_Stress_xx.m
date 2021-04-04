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
Lx = 300;
h = 3;
[ar_N,ar_D] = rat(h/Lx);
file = sprintf('Problem_NL_1_Stress_xx');

figure;
fig_size = get(0,'screensize');
fig_size(3) = fig_size(3)/2;
set(gcf,'Position',fig_size);
set(gcf,'PaperPositionMode','auto');
set(gcf,'name',file,'numbertitle','off');
hold on;

Colors = [
      0.16,     0.44,    1.00;
      0.93,     0.00,    0.00;
      0.00,     0.57,    0.00;
      0.44,     0.00,    0.99;
      1.00,     0.50,    0.10;
      0.75,     0.00,    0.75;
      0.50,     0.50,    0.50;
      0.50,     0.57,    0.00;
      0.17,     0.17,    0.17;
      0.00,     0.00,    0.00;
      ];

load(fullfile(pwd,'plots','Poblem_NL_1_Linear_TSDT.mat'));
h1 = plot(Data_xx(:,1),Data_xx(:,2),'-','LineWidth',4,'Color',Colors(1,:));


load(fullfile(pwd,'plots','Poblem_NL_1_vonKarman_TSDT.mat'));
h2 = plot(Data_xx(:,1),Data_xx(:,2),'--','LineWidth',4,'Color',Colors(2,:));

load(fullfile(pwd,'plots','Poblem_NL_1_Green_TSDT.mat'));
h3 = plot(Data_xx(:,1),Data_xx(:,2),':','LineWidth',4,'Color',Colors(3,:));

  
temp = csvread(fullfile(pwd,'plots','CCCC_Isotropic_Stress_xx_Linear.csv'));
h4 = plot(temp(:,1),temp(:,2),'o','LineWidth',4,'Color',Colors(4,:));
set(h4,'MarkerFaceColor','none','MarkerSize',15);


temp = load(fullfile(pwd,'plots','CCCC_Isotropic_Stress_xx_vonKarman_IGATSDT.csv'));
h5 = plot(temp(:,1),temp(:,2),'.','linewidth',3,'Color',Colors(4,:));
set(h5,'Marker','o','MarkerFaceColor','none','MarkerSize',15);

temp = csvread(fullfile(pwd,'plots','CCCC_Isotropic_Stress_xx_vonKarman_MIXFEM.csv'));
h6 = plot(temp(:,1),temp(:,2),'.','linewidth',3,'Color',Colors(5,:));
set(h6,'Marker','*','MarkerFaceColor','none','MarkerSize',20);

temp = csvread(fullfile(pwd,'plots','CCCC_Isotropic_Stress_xx_vonKarman_Exact.csv'));
h7 = plot(temp(:,1),temp(:,2),'.','LineWidth',4,'Color',Colors(6,:));
set(h7,'Marker','^','MarkerFaceColor','none','MarkerSize',15);

legendID = [h4(1),h1(1),...
    h7(1),h6(1),h5(1),h2(1),h3(1)];
legendString = {sprintf('IGA-TSDT (Tran et al.)'),...
    sprintf('FEM TSDT (Linear)'),...
    sprintf('Exact (Levy)'),...
    sprintf('MIXFEM (Urthaler and Reddy)'),...
    sprintf('IGA-TSDT (von Karman) (Tran et al.)'),...
    sprintf('FEM-TSDT (von Karman)'),...
    sprintf('FEM-TSDT (Green-Lagrange)')};

[h_legend,icons,plots,legend_text] = legend(legendID,legendString,...
    'location','southeast');
set(h_legend,'FontSize',17);
icons(1).FontSize = 15;
icons(2).FontSize = 15;
icons(3).FontSize = 15;
icons(4).FontSize = 15;
icons(5).FontSize = 15;
icons(6).FontSize = 15;
icons(7).FontSize = 15;

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

set(gca,'YTick',[0:5:25]);
set(gca,'XTick',[0,100,200,300,400]);
set(gca,'YLim',[0,25]);
set(gca,'XLim',[0,405]);
set(gca,'lineWidth',1.5);
% set(gca,'FontSize',25,'FontWeight','bold','FontName','Helvetica');
set(gca,'FontSize',20,'FontWeight','normal','FontName','Arial');
xlabel('\bf Load $\bf( \bar{P} )$',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',20);
ylabel('\bf Axial Stress $\bf( \bar{\sigma}_{xx} )$',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',20);
drawnow;

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

