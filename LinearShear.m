function [BLs] = LinearShear(ndof,nnel,S1Matrix,R,dRdx,dRdy)

BLs=zeros(size(S1Matrix,2),ndof*nnel);
for innel=1:nnel

i1=(innel-1)*ndof+1;  
i2=i1+1;
i3=i2+1;
i4=i3+1;
i5=i4+1;
i6=i5+1;
i7=i6+1;

BLs(1,i5) = R(innel);
BLs(1,i3) = dRdy(innel);

BLs(2,i4) = R(innel);
BLs(2,i3) = dRdx(innel);

BLs(3,i7) = R(innel);

BLs(4,i6) = R(innel);

end

end
