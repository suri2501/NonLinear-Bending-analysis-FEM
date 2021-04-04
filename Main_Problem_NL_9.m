folder = 'Problem9_3';
if(~exist(folder,'dir'))
mkdir(folder)
end

for iAngle = 0:5:90
    theta_angle = iAngle;
    Main
    save(fullfile(pwd,'Problem9_3',[file,'.mat']),'Data_W');
    clear Data_W;
end

