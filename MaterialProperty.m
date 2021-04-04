function[Qbar,B1Matrix,B2Matrix,B3Matrix,B4Matrix,...
    S1Matrix,S2Matrix,S3Matrix,S4Matrix] = ...
    MaterialProperty(E1,E2,NU12,NU21,...
    G12,G13,G23,h,theta,nol,funF,fundF)
z = linspace(-h/2,h/2,nol+1);

funZ_Bl = @(z) ...
    [1,  0,  0,  z,  0,  0,  funF(z),  0,        0;
     0,  1,  0,  0,  z,  0,  0,        funF(z),  0;
     0,  0,  1,  0,  0,  z,  0,        0,        funF(z)];

funZ_Bnl = @(z) ...
    [1,  0,  0,  z,  0,  0,  funF(z),  0,        0,        z.^2,  0,     0,    z.*funF(z),  0,           0,           funF(z).^2,  0,           0;
     0,  1,  0,  0,  z,  0,  0,        funF(z),  0,        0,     z.^2,  0,    0,           z.*funF(z),  0,           0,           funF(z).^2,  0;
     0,  0,  1,  0,  0,  z,  0,        0,        funF(z),  0,     0,     z.^2  0,           0,           z.*funF(z),  0,           0,           funF(z).^2;];

funZ_Sl = @(z) ...
    [1,  0,  fundF(z),  0;
     0,  1,  0          fundF(z);];

funZ_Snl = @(z) ...
    [1,  0,  z,  0,  funF(z),  0,        fundF(z),  0,         z.*fundF(z),  0,            funF(z).*fundF(z),  0;
     0,  1,  0,  z,  0,        funF(z),  0,         fundF(z),  0,            z.*fundF(z),  0,                  funF(z).*fundF(z);];

tempB1 = size(funZ_Bl(0),2);
tempB2 = size(funZ_Bnl(0),2);

B1Matrix = zeros(tempB1,tempB1);
B2Matrix = zeros(tempB1,tempB2);
B3Matrix = zeros(tempB2,tempB1);
B4Matrix = zeros(tempB2,tempB2);

tempS1 = size(funZ_Sl(0),2);
tempS2 = size(funZ_Snl(0),2);
 
S1Matrix = zeros(tempS1,tempS1);
S2Matrix = zeros(tempS1,tempS2);
S3Matrix = zeros(tempS2,tempS1);
S4Matrix = zeros(tempS2,tempS2);

% Qbar
Qbar = zeros(5,5,nol);

% Reduced Stiffness Matrix
[Qb,Qs,Q] = ReducedStiffness(E1,E2,NU12,NU21,G12,G13,G23);

% layers angles
for k=1:nol
[Qbarb,Qbars,Qbar(:,:,k)] = TransformedReducedStiffness(Qb,Qs,theta(k)); 
ErrorLimit = 1e-4;
% Inplane Part : Linear - Linear
funBTB = @(z) mtimes(Qbarb,funZ_Bl(z));
funBTB = @(z) mtimes(funZ_Bl(z)',funBTB(z));
B1Matrix = B1Matrix + integral(@(z) funBTB(z),z(k),z(k+1),'ArrayValued',true,'RelTol',ErrorLimit,'AbsTol',ErrorLimit);
% Linear - NonLinear
funBTB = @(z) mtimes(Qbarb,funZ_Bnl(z));
funBTB = @(z) mtimes(funZ_Bl(z)',funBTB(z));
B2Matrix = B2Matrix + integral(@(z) funBTB(z),z(k),z(k+1),'ArrayValued',true,'RelTol',ErrorLimit,'AbsTol',ErrorLimit);
% NonLinear - Linear
funBTB = @(z) mtimes(Qbarb,funZ_Bl(z));
funBTB = @(z) mtimes(funZ_Bnl(z)',funBTB(z));
B3Matrix = B3Matrix + integral(@(z) funBTB(z),z(k),z(k+1),'ArrayValued',true,'RelTol',ErrorLimit,'AbsTol',ErrorLimit);
% NonLinear - NonLinear
funBTB = @(z) mtimes(Qbarb,funZ_Bnl(z));
funBTB = @(z) mtimes(funZ_Bnl(z)',funBTB(z));
B4Matrix = B4Matrix + integral(@(z) funBTB(z),z(k),z(k+1),'ArrayValued',true,'RelTol',ErrorLimit,'AbsTol',ErrorLimit);

% Shear Part : Linear - Linear
funSTS = @(z) mtimes(Qbars,funZ_Sl(z));
funSTS = @(z) mtimes(funZ_Sl(z)',funSTS(z));
S1Matrix = S1Matrix + integral(@(z) funSTS(z),z(k),z(k+1),'ArrayValued',true,'RelTol',ErrorLimit,'AbsTol',ErrorLimit);
% Linear - NonLinear
funSTS = @(z) mtimes(Qbars,funZ_Snl(z));
funSTS = @(z) mtimes(funZ_Sl(z)',funSTS(z));
S2Matrix = S2Matrix + integral(@(z) funSTS(z),z(k),z(k+1),'ArrayValued',true,'RelTol',ErrorLimit,'AbsTol',ErrorLimit);
% NonLinear - Linear
funSTS = @(z) mtimes(Qbars,funZ_Sl(z));
funSTS = @(z) mtimes(funZ_Snl(z)',funSTS(z));
S3Matrix = S3Matrix + integral(@(z) funSTS(z),z(k),z(k+1),'ArrayValued',true,'RelTol',ErrorLimit,'AbsTol',ErrorLimit);
% NonLinear - NonLinear
funSTS = @(z) mtimes(Qbars,funZ_Snl(z));
funSTS = @(z) mtimes(funZ_Snl(z)',funSTS(z));
S4Matrix = S4Matrix + integral(@(z) funSTS(z),z(k),z(k+1),'ArrayValued',true,'RelTol',ErrorLimit,'AbsTol',ErrorLimit);

end

end