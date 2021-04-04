function [Sb] = InitialStressb_e(Parameter,ndof,nnel,R,dRdx,dRdy,...
    B1Matrix,B2Matrix,B3Matrix,B4Matrix,u_e,v_e,w_e,phix_e,phiy_e,thetax_e,thetay_e)

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

% phix = phix_e*R;
dphixdx = phix_e*dRdx;
dphixdy = phix_e*dRdy;

% phiy = phiy_e*R;
dphiydx = phiy_e*dRdx;
dphiydy = phiy_e*dRdy;

% thetax = thetax_e*R;
dthetaxdx = thetax_e*dRdx;
dthetaxdy = thetax_e*dRdy;

% thetay = thetay_e*R;
dthetaydx = thetay_e*dRdx;
dthetaydy = thetay_e*dRdy;

strain_L = [dudx, dvdy, dudy+dvdx, dphixdx, dphiydy, (dphixdy+dphiydx), dthetaxdx, dthetaydy, (dthetaxdy+dthetaydx)]';

Ab = [  dudx       0          dvdx       0          dwdx  0      0          0          0          0          0          0          0          0;
        0          dudy       0          dvdy       0     dwdy   0          0          0          0          0          0          0          0;
        dudy       dudx       dvdy       dvdx       dwdy  dwdx   0          0          0          0          0          0          0          0;
        
        dphixdx    0          dphiydx    0          0     0      dudx       0          dvdx       0          0          0          0          0;
        0          dphixdy    0          dphiydy    0     0      0          dudy       0          dvdy       0          0          0          0;
        dphixdy    dphixdx    dphiydy    dphiydx    0     0      dudy       dudx       dvdy       dvdx       0          0          0          0;
        
        dthetaxdx  0          dthetaydx  0          0     0      0          0          0          0          dudx       0          dvdx       0;
        0          dthetaxdy  0          dthetaydy  0     0      0          0          0          0          0          dudy       0          dvdy;
        dthetaxdy  dthetaxdx  dthetaydy  dthetaydx  0     0      0          0          0          0          dudy       dudx       dvdy       dvdx;
        
        0          0          0          0          0     0      dphixdx    0          dphiydx    0          0          0          0          0;
        0          0          0          0          0     0      0          dphixdy    0          dphiydy    0          0          0          0;
        0          0          0          0          0     0      dphixdy    dphixdx    dphiydy    dphiydx    0          0          0          0;
        
        0          0          0          0          0     0      dthetaxdx  0          dthetaydx  0          dphixdx    0          dphiydx    0;
        0          0          0          0          0     0      0          dthetaxdy  0          dthetaydy  0          dphixdy    0          dphiydy;
        0          0          0          0          0     0      dthetaxdy  dthetaxdx  dthetaydy  dthetaydx  dphixdy    dphixdx    dphiydy    dphiydx;
        
        0          0          0          0          0     0      0          0          0          0          dthetaxdx  0          dthetaydx  0;      
        0          0          0          0          0     0      0          0          0          0          0          dthetaxdy  0          dthetaydy;
        0          0          0          0          0     0      0          0          0          0          dthetaxdy  dthetaxdx  dthetaydy  dthetaydx;
    ];
Tempb = [dudx, dudy, dvdx, dvdy, dwdx, dwdy, dphixdx, dphixdy,  dphiydx, dphiydy, dthetaxdx, dthetaxdy, dthetaydx, dthetaydy]';
if strcmp(Parameter.Type,'Linear')
    Tempb(:,1) = 0;
end
if strcmp(Parameter.Type,'vonKarman')
    Tempb([1:4,7:end],1) = 0;
end
strain_NL = Ab*Tempb;

stress = B3Matrix*strain_L + 0.5*B4Matrix*strain_NL;

Nx = stress(1);
Ny = stress(2);
Nxy = stress(3);

Mx = stress(4);
My = stress(5);
Mxy = stress(6);

Px = stress(7);
Py = stress(8);
Pxy = stress(9);

Qx = stress(10);
Qy = stress(11);
Qxy = stress(12);

Rx = stress(13);
Ry = stress(14);
Rxy = stress(15);

Sx = stress(16);
Sy = stress(17);
Sxy = stress(18);

Sb = [  Nx,     Nxy,    0,      0,      0,      0,      Mx,     Mxy,    0,      0,      Px,     Pxy,    0,      0;
        Nxy,    Ny,     0,      0,      0,      0,      Mxy,    My,     0,      0,      Pxy,    Py,     0,      0;
        0,      0,      Nx,     Nxy,    0,      0,      0,      0,      Mx,     Mxy,    0,      0,      Px,     Pxy;
        0,      0,      Nxy,    Ny,     0,      0,      0,      0,      Mxy,    My,     0,      0,      Pxy,    Py;
        0,      0,      0,      0,      Nx,     Nxy,    0,      0,      0,      0,      0,      0,      0,      0;
        0,      0,      0,      0,      Nxy,    Ny,     0,      0,      0,      0,      0,      0,      0,      0;
        Mx,     Mxy,    0,      0,      0,      0,      Qx,     Qxy,    0,      0,      Rx,     Rxy,    0,      0;
        Mxy,    My,     0,      0,      0,      0,      Qxy,    Qy,     0,      0,      Rxy,    Ry,     0,      0;
        0,      0,      Mx,     Mxy,    0,      0,      0,      0,      Qx,     Qxy,    0,      0,      Rx,     Rxy;
        0,      0,      Mxy,    My,     0,      0,      0,      0,      Qxy,    Qy,     0,      0,      Rxy,    Ry;
        Px,     Pxy,    0,      0,      0,      0,      Rx,     Rxy,    0,      0,      Sx,     Sxy,    0,      0;
        Pxy,    Py,     0,      0,      0,      0,      Rxy,    Ry,     0,      0,      Sxy,    Sy,     0,      0;
        0,      0,      Px,     Pxy,    0,      0,      0,      0,      Rx,     Rxy,    0,      0,      Sx,     Sxy;
        0,      0,      Pxy,    Py,     0,      0,      0,      0,      Rxy,    Ry,     0,      0,      Sxy,    Sy;
      ];

end