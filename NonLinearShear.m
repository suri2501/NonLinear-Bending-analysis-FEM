function [As,Gs] = NonLinearShear(ndof,nnel,R,dRdx,dRdy,...
    u_e,v_e,w_e,phix_e,phiy_e,thetax_e,thetay_e)

% u = u_e*R;
dudx = u_e*dRdx;
dudy = u_e*dRdy;

% v = v_e*R;
dvdx = v_e*dRdx;
dvdy = v_e*dRdy;

% w = w_e*R;
% dwdx = w_e*dRdx;
% dwdy = w_e*dRdy;

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

%%
Gs = zeros(size(As,2),ndof*nnel);
for innel=1:nnel
i1=(innel-1)*ndof+1;  
i2=i1+1;
i3=i2+1;
i4=i3+1;
i5=i4+1;
i6=i5+1;
i7=i6+1;

Gs(1,i4)= R(innel);
Gs(2,i5)= R(innel);

Gs(3,i6)= R(innel);
Gs(4,i7)= R(innel);

Gs(5,i1)= dRdx(innel);
Gs(6,i1)= dRdy(innel);

Gs(7,i2)= dRdx(innel);
Gs(8,i2)= dRdy(innel);

Gs(9,i4)= dRdx(innel);
Gs(10,i4)= dRdy(innel);

Gs(11,i5)= dRdx(innel);
Gs(12,i5)= dRdy(innel);

Gs(13,i6)= dRdx(innel);
Gs(14,i6)= dRdy(innel);

Gs(15,i7)= dRdx(innel);
Gs(16,i7)= dRdy(innel);

end

 

end