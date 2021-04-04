function [Ss] = InitialStresss_e(ndof,nnel,R,dRdx,dRdy,...
    S1Matrix,S2Matrix,S3Matrix,S4Matrix,u_e,v_e,w_e,phix_e,phiy_e,thetax_e,thetay_e)

%--------------------------------------------------------------------------
% S Matrix
%--------------------------------------------------------------------------
% u = u_e*R;
dudx = u_e*dRdx;
dudy = u_e*dRdy;

% v = v_e*R;
dvdx = v_e*dRdx;
dvdy = v_e*dRdy;

% w = w_e*R;
dwdx = w_e*dRdx;
dwdy = w_e*dRdy;

phix = phix_e*R;
dphixdx = phix_e*dRdx;
dphixdy = phix_e*dRdy;

phiy = phiy_e*R;
dphiydx = phiy_e*dRdx;
dphiydy = phiy_e*dRdy;

thetax = thetax_e*R;
dthetaxdx = thetax_e*dRdx;
dthetaxdy = thetax_e*dRdy;

thetay = thetay_e*R;
dthetaydx = thetay_e*dRdx;
dthetaydy = thetay_e*dRdy;

strain_L = [phiy+dwdy, phix+dwdx,thetay,thetax]';

As = [  
    dudy       dvdy       0          0          0       phix    0       phiy    0       0       0       0       0       0       0       0;
    dudx       dvdx       0          0          phix    0       phiy    0       0       0       0       0       0       0       0       0;
    
    dphixdy    dphiydy    0          0          0       0       0       0       0       phix    0       phiy    0       0       0       0;
    dphixdx    dphiydx    0          0          0       0       0       0       phix    0       phiy    0       0       0       0       0;
    
    dthetaxdy  dthetaydy  0          0          0       0       0       0       0       0       0       0       0       phix    0       phiy;
    dthetaxdx  dthetaydx  0          0          0       0       0       0       0       0       0       0       phix    0       phiy    0;
    
    0          0          dudy       dvdy       0       thetax  0       thetay  0       0       0       0       0       0       0       0;
    0          0          dudx       dvdx       thetax  0       thetay  0       0       0       0       0       0       0       0       0;
    
    0          0          dphixdy    dphiydy    0       0       0       0       0       thetax  0       thetay  0       0       0       0;
    0          0          dphixdx    dphiydx    0       0       0       0       thetax  0       thetay  0       0       0       0       0;
    
    0          0          dthetaxdy  dthetaydy  0       0       0       0       0       0       0       0       0       thetax  0       thetay;
    0          0          dthetaxdx  dthetaydx  0       0       0       0       0       0       0       0       thetax  0       thetay  0;
    ];

Temps = [phix, phiy, thetax, thetay, dudx, dudy, dvdx, dvdy, dphixdx, dphixdy,  dphiydx, dphiydy, dthetaxdx, dthetaxdy, dthetaydx, dthetaydy]';
strain_NL = As*Temps;

stress = S3Matrix*strain_L + 0.5*S4Matrix*strain_NL;

Nyz = stress(1);
Nxz = stress(2);

Myz = stress(3);
Mxz = stress(4);

Pyz = stress(5);
Pxz = stress(6);

Qyz = stress(7);
Qxz = stress(8);

Ryz = stress(9);
Rxz = stress(10);

Syz = stress(11);
Sxz = stress(12);

Ss = [  0,      0,      0,      0,      Nxz,    Nyz,    0,      0,      Mxz,    Myz,    0,      0,      Pxz,   Pyz,     0,      0;
        0,      0,      0,      0,      0,      0,      Nxz,    Nyz,    0,      0,      Mxz,    Myz,    0,      0,      Pxz,    Pyz;
        0,      0,      0,      0,      Qxz,    Qyz,    0,      0,      Rxz     Ryz,    0,      0,      Sxz,    Syz,    0,      0;
        0,      0,      0,      0,      0,      0,      Qxz,    Qyz,    0,      0,      Rxz,    Ryz,    0,      0,      Sxz,    Syz;
        Nxz,    0,      Qxz,    0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0;
        Nyz,    0,      Qyz,    0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0;
        0,      Nxz,    0,      Qxz,    0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0;
        0,      Nyz,    0,      Qyz,    0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0;
        Mxz,    0,      Rxz,    0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0;
        Myz,    0,      Ryz,    0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0;
        0,      Mxz,    0,      Rxz,    0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0;
        0,      Myz,    0,      Ryz,    0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0;
        Pxz,    0,      Sxz,    0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0;
        Pyz,    0,      Syz,    0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0;
        0,      Pxz,    0,      Sxz,    0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0;
        0,      Pyz,    0,      Syz,    0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0;
      ];

end