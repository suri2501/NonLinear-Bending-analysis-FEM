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
file = sprintf('Problem_NL_1');

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
h1 = plot(Data_W(:,1),Data_W(:,2),'-','LineWidth',4,'Color',Colors(1,:));


load(fullfile(pwd,'plots','Poblem_NL_1_vonKarman_TSDT.mat'));
h2 = plot(Data_W(:,1),Data_W(:,2),'--','LineWidth',4,'Color',Colors(2,:));

load(fullfile(pwd,'plots','Poblem_NL_1_Green_TSDT.mat'));
h3 = plot(Data_W(:,1),Data_W(:,2),':','LineWidth',4,'Color',Colors(3,:));

  
temp = csvread(fullfile(pwd,'plots','CCCC_Isotropic_Linear.csv'));
h4 = plot(temp(:,1),temp(:,2),'o','LineWidth',4,'Color',Colors(4,:));
set(h4,'MarkerFaceColor','none','MarkerSize',15);


load(fullfile(pwd,'plots','IGA_Tran_Nonlinear_CCCC_Isotropic_h_By_a_1_100.mat'));
h5 = plot(Data(:,1),Data(:,2),'.','linewidth',4,'Color',Colors(4,:));
set(h5,'Marker','o','MarkerFaceColor','none','MarkerSize',15);

temp = csvread(fullfile(pwd,'plots','CCCC_Isotropic_MIXFEM_FEMQ9_Tran.csv'));
h6 = plot(temp(:,1),temp(:,2),'.','linewidth',3,'Color',Colors(5,:));
set(h6,'Marker','*','MarkerFaceColor','none','MarkerSize',20);

temp = csvread(fullfile(pwd,'plots','CCCC_Isotropic_Exact.csv'));
h7 = plot(temp(:,1),temp(:,2),'.','LineWidth',4,'Color',Colors(6,:));
set(h7,'Marker','^','MarkerFaceColor','none','MarkerSize',15);

Data = [
   0.25000E-01 -0.135712E-002
   0.50000E-01 -0.264810E-002
   0.75000E-01 -0.383102E-002
   0.10000     -0.489706E-002
   0.12500     -0.585288E-002
   0.15000     -0.671227E-002
   0.17500     -0.748968E-002
   0.20000     -0.819828E-002
   0.22500     -0.884803E-002
   0.25000     -0.944818E-002
   0.27500     -0.100059E-001
   0.30000     -0.105269E-001
   0.32500     -0.110160E-001
   0.35000     -0.114771E-001
   0.37500     -0.119134E-001
   0.40000     -0.123278E-001
   0.42500     -0.127224E-001
   0.45000     -0.130993E-001
   0.47500     -0.134602E-001
   0.50000     -0.138065E-001
   0.52500     -0.141394E-001
   0.55000     -0.144602E-001
   0.57500     -0.147698E-001
   0.60000     -0.150689E-001
   0.62500     -0.153585E-001
   0.65000     -0.156392E-001
   0.67500     -0.159115E-001
   0.70000     -0.161761E-001
   0.72500     -0.164334E-001
   0.75000     -0.166840E-001
   0.77500     -0.169281E-001
   0.80000     -0.171662E-001
   0.82500     -0.173986E-001
   0.85000     -0.176257E-001
   0.87500     -0.178476E-001
   0.90000     -0.180647E-001
   0.92500     -0.182772E-001
   0.95000     -0.184854E-001
   0.97500     -0.186894E-001
    1.0000     -0.188895E-001
];
Data(:,1) = Data(:,1)*400;
Data(:,2) = -Data(:,2)*100;
h8 = plot(Data(:,1),Data(:,2),'-.','LineWidth',3,'Color','k');
set(h8,'Marker','none','MarkerFaceColor','none','MarkerSize',10);


legendID = [h4(1),h1(1),...
    h7(1),h6(1),h5(1),h2(1),h3(1),h8(1)];
legendString = {sprintf('IGA-TSDT (Tran et al.)'),...
    sprintf('FEM TSDT (Linear)'),...
    sprintf('Exact (Levy)'),...
    sprintf('MIXFEM (Urthaler and Reddy)'),...
    sprintf('IGA-TSDT (von Karman) (Tran et al.)'),...
    sprintf('FEM-TSDT (von Karman)'),...
    sprintf('FEM-TSDT (Green-Lagrange)'),...
    sprintf('ANSYS')};

[h_legend,icons,plots,legend_text] = legend(legendID,legendString,'location','southeast');
set(h_legend,'FontSize',16);
icons(1).FontSize = 15;
icons(2).FontSize = 15;
icons(3).FontSize = 15;
icons(4).FontSize = 15;
icons(5).FontSize = 14;
icons(6).FontSize = 15;
icons(7).FontSize = 15;
icons(8).FontSize = 15;

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

set(gca,'YTick',[0, 0.5,1,1.5,2]);
set(gca,'XTick',[0,100,200,300,400]);
set(gca,'YLim',[0,2]);
set(gca,'XLim',[0,405]);
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

set(gca,'Position',get(gca, 'OuterPosition') - get(gca, 'TightInset')*...
   [-1 0 1 0;0 -1 0 1; 0 0 1 0; 0 0 0 1]);
set(gca, 'Position', [0.15 0.15 0.80 0.80]);
% set(h_legend,'location','best');

% set(gcf,'renderer','opengl');
set(gcf,'renderer','painters');
% set(gcf,'PaperOrientation','portrait');
% break;
% print(fullfile(pwd,'plots',get(gcf,'Name')), '-depsc2', '-r1200');
% print(fullfile(pwd,'plots',get(gcf,'Name')), '-dpng', '-r100');


