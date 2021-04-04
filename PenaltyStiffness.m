function [Px,Py]=PenaltyStiffness(ndof,nnel,R,dRdx,dRdy)

Px = zeros(1,ndof*nnel);
Py = zeros(1,ndof*nnel);
for innel=1:nnel
i1 = (innel-1)*ndof+1;  
i2 = i1+1;
i3 = i2+1;
i4 = i3+1;
i5 = i4+1;
i6 = i5+1;
i7 = i6+1;

Px(1,i3) = dRdy(innel);
Px(1,i5) = R(innel);

Py(1,i3) = dRdx(innel);
Py(1,i4) = R(innel);

end
 
end