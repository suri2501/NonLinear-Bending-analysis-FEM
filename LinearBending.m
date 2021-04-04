function [BLb] = LinearBending(ndof,nnel,B1Matrix,dRdx,dRdy)

BLb=zeros(size(B1Matrix,2),ndof*nnel);
for innel=1:nnel

i1=(innel-1)*ndof+1;  
i2=i1+1;
i3=i2+1;
i4=i3+1;
i5=i4+1;
i6=i5+1;
i7=i6+1;

%-----------------%
BLb(1,i1)=dRdx(innel);
BLb(2,i2)=dRdy(innel);
BLb(3,i1)=dRdy(innel);
BLb(3,i2)=dRdx(innel);
%-----------------%
BLb(4,i4)=dRdx(innel);
BLb(5,i5)=dRdy(innel);
BLb(6,i4)=dRdy(innel);
BLb(6,i5)=dRdx(innel);
%-----------------%
BLb(7,i6)=dRdx(innel);
BLb(8,i7)=dRdy(innel);
BLb(9,i6)=dRdy(innel);
BLb(9,i7)=dRdx(innel);

end

end