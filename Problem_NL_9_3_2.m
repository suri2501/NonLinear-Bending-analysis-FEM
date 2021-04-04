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
file = sprintf('Problem_NL_9_3_2');

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
  
iAngle = 0:5:90;
AsLinearIHSDT = [];
AsvonKarmanIHSDT = [];
AsGreenIHSDT = [];
SLinearIHSDT = [];
SvonKarmanIHSDT = [];
SGreenIHSDT = [];
for ii = 1:length(iAngle)
    load(fullfile(pwd,'Problem9_3',sprintf('Poblem_NL_9_3_Linear_UDL_h_a_1_4_IHSDT_SSSS1_AS_%g.mat',iAngle(ii))));
    AsLinearIHSDT = [AsLinearIHSDT; Data_W(:,2)';];
    load(fullfile(pwd,'Problem9_3',sprintf('Poblem_NL_9_3_vonKarman_UDL_h_a_1_4_IHSDT_SSSS1_AS_%g.mat',iAngle(ii))));
    AsvonKarmanIHSDT = [AsvonKarmanIHSDT; Data_W(:,2)';];
    load(fullfile(pwd,'Problem9_3',sprintf('Poblem_NL_9_3_Green_UDL_h_a_1_4_IHSDT_SSSS1_AS_%g.mat',iAngle(ii))));
    AsGreenIHSDT = [AsGreenIHSDT; Data_W(:,2)';];
    load(fullfile(pwd,'Problem9_3',sprintf('Poblem_NL_9_3_Linear_UDL_h_a_1_4_IHSDT_SSSS1_S_%g.mat',iAngle(ii))));
    SLinearIHSDT = [SLinearIHSDT; Data_W(:,2)';];
    load(fullfile(pwd,'Problem9_3',sprintf('Poblem_NL_9_3_vonKarman_UDL_h_a_1_4_IHSDT_SSSS1_S_%g.mat',iAngle(ii))));
    SvonKarmanIHSDT = [SvonKarmanIHSDT; Data_W(:,2)';];
    load(fullfile(pwd,'Problem9_3',sprintf('Poblem_NL_9_3_Green_UDL_h_a_1_4_IHSDT_SSSS1_S_%g.mat',iAngle(ii))));
    SGreenIHSDT = [SGreenIHSDT; Data_W(:,2)';];
end
AsLinearIHSDT(:,1) = 0:5:90;
AsvonKarmanIHSDT(:,1) = 0:5:90;
AsGreenIHSDT(:,1) = 0:5:90;
SLinearIHSDT(:,1) = 0:5:90;
SvonKarmanIHSDT(:,1) = 0:5:90;
SGreenIHSDT(:,1) = 0:5:90;



h10 = plot(AsLinearIHSDT(:,1),AsLinearIHSDT(:,2:end),'-.','LineWidth',1.5,'Color',Colors(1,:));
set(h10,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

h20 = plot(AsvonKarmanIHSDT(:,1),AsvonKarmanIHSDT(:,2:end),'-','LineWidth',1.5,'Color',Colors(2,:));
set(h20,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

h30 = plot(AsGreenIHSDT(:,1),AsGreenIHSDT(:,2:end),'-','LineWidth',1.5,'Color',Colors(3,:));
set(h30,'Marker','^','MarkerFaceColor','none','MarkerSize',10);



h1 = plot(SLinearIHSDT(:,1),SLinearIHSDT(:,2:end),':','LineWidth',1.5,'Color',Colors(4,:));
set(h1,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

h2 = plot(SvonKarmanIHSDT(:,1),SvonKarmanIHSDT(:,2:end),'-.','LineWidth',1.5,'Color',Colors(5,:));
set(h2,'Marker','none','MarkerFaceColor','none','MarkerSize',10);

h3 = plot(SGreenIHSDT(:,1),SGreenIHSDT(:,2:end),'-','LineWidth',1.5,'Color',Colors(6,:));
set(h3,'Marker','o','MarkerFaceColor','none','MarkerSize',10);


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

set(gca,'YTick',[0.0:1:6]);
set(gca,'YLim',[0.0,8]);
set(gca,'XTick',[0:15:90]);
set(gca,'XLim',[0,90]);
set(gca,'lineWidth',1.5);
% set(gca,'FontSize',25,'FontWeight','bold','FontName','Helvetica');
set(gca,'FontSize',20,'FontWeight','normal','FontName','Arial');
xlabel('\bf Fiber orientation $\bf ( \theta ) $',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',20);
ylabel('\bf Central Deflection $\bf (\bar{w})$',...
    'Interpreter', 'Latex','FontName','Arial',...
    'FontWeight','bold','FontSize',20);
drawnow;

legendID = [h1(1),h2(1),h3(1),h10(1),h20(1),h30(1)];
legendString = {...
    sprintf('\\bf Linear $$ (-\\theta/\\theta/\\theta/-\\theta) $$'),...
    sprintf('\\bf von Karman $$ (-\\theta/\\theta/\\theta/-\\theta) $$'),...
    sprintf('\\bf Green-Lagrange $$ (-\\theta/\\theta/\\theta/-\\theta) $$'),...
    sprintf('\\bf Linear $$ (-\\theta/\\theta/-\\theta/\\theta) $$'),...
    sprintf('\\bf von Karman $$ (-\\theta/\\theta/-\\theta/\\theta) $$'),...
    sprintf('\\bf Green-Lagrange $$ (-\\theta/\\theta/-\\theta/\\theta) $$')
    };

[h_legend,icons,plots,legend_text]= legend(legendID,legendString,...
    'location','northwest','Interpreter','Latex');
set(h_legend,'FontSize',15);
icons(1).FontSize = 15;
icons(2).FontSize = 15;
icons(3).FontSize = 15;
icons(4).FontSize = 15;
icons(5).FontSize = 15;
icons(6).FontSize = 15;
% icons(7).Color = 'k';
% icons(18).Color = 'k';




set(gca,'Position',get(gca, 'OuterPosition') - get(gca, 'TightInset')*...
   [-1 0 1 0;0 -1 0 1; 0 0 1 0; 0 0 0 1]);
set(gca, 'Position', [0.15 0.15 0.80 0.80]);
% set(h_legend,'location','best');

annotation('textarrow',[0.55,0.55],[0.17,0.60],...
    'LineStyle','--','LineWidth',1.0);
annotation('textbox',[0.56 0.60 0.05 0.04],...
    'String',{'$$\bar{P} = 300$$'},...
    'interpreter','latex','FontSize',15,...
    'LineStyle','--','LineWidth',1.0,...
    'FitBoxToText','on');
annotation('textbox',[0.56 0.15 0.05 0.04],...
    'String',{'$$\bar{P} = 50$$'},...
    'interpreter','latex','FontSize',15,...
    'LineStyle','--','LineWidth',1.0,...
    'FitBoxToText','on');

% set(gcf,'renderer','opengl');
set(gcf,'renderer','painters');
% set(gcf,'PaperOrientation','portrait');
% break;
print(fullfile(pwd,'plots',get(gcf,'Name')), '-depsc2', '-r1200');
print(fullfile(pwd,'plots',get(gcf,'Name')), '-dpng', '-r100');

