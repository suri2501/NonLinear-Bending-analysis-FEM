function [Ab,Gb] = NonLinearBending(ndof,nnel,dRdx,dRdy,...
    u_e,v_e,w_e,phix_e,phiy_e,thetax_e,thetay_e)

dudx = u_e*dRdx;
dudy = u_e*dRdy;

dvdx = v_e*dRdx;
dvdy = v_e*dRdy;

dwdx = w_e*dRdx;
dwdy = w_e*dRdy;

dphixdx = phix_e*dRdx;
dphixdy = phix_e*dRdy;

dphiydx = phiy_e*dRdx;
dphiydy = phiy_e*dRdy;

dthetaxdx = thetax_e*dRdx;
dthetaxdy = thetax_e*dRdy;

dthetaydx = thetay_e*dRdx;
dthetaydy = thetay_e*dRdy;

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

%%
Gb = zeros(size(Ab,2),ndof*nnel);
for innel=1:nnel
i1=(innel-1)*ndof+1;  
i2=i1+1;
i3=i2+1;
i4=i3+1;
i5=i4+1;
i6=i5+1;
i7=i6+1;

Gb(1,i1)= dRdx(innel);
Gb(2,i1)= dRdy(innel);

Gb(3,i2)= dRdx(innel);
Gb(4,i2)= dRdy(innel);

Gb(5,i3)= dRdx(innel);
Gb(6,i3)= dRdy(innel);

Gb(7,i4)= dRdx(innel);
Gb(8,i4)= dRdy(innel);

Gb(9,i5)= dRdx(innel);
Gb(10,i5)= dRdy(innel);

Gb(11,i6)= dRdx(innel);
Gb(12,i6)= dRdy(innel);

Gb(13,i7)= dRdx(innel);
Gb(14,i7)= dRdy(innel);

end

% BNLb = Ab*Gb;

end