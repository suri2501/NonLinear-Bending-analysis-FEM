function [fm] = Force(ndof,nnel,R)

fm=zeros(ndof*nnel,1);
for innel = 1:nnel

i1=(innel-1)*ndof+1;  
i2=i1+1;
i3=i2+1;
i4=i3+1;
i5=i4+1;
i6=i5+1;
i7=i6+1;

fm(i3,1) = R(innel);

end

end