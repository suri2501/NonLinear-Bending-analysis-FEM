function [dRdx,dRdy] = ShapefunctionDerivatives(dRdxi,dRdeta,invJ22)

dNdx = invJ22*[dRdxi';dRdeta'];

dRdx = dNdx(1,:)';
dRdy = dNdx(2,:)';

end