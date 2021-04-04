function [detJ22,invJ22] = Jacobian(dRdxi,dRdeta,x_e,y_e)

J22 = zeros(2,2);

J22(1,1) = x_e*dRdxi;
J22(1,2) = y_e*dRdxi;
J22(2,1) = x_e*dRdeta;
J22(2,2) = y_e*dRdeta;

detJ22 = det(J22);  % Determinant of Jacobian matrix
invJ22 = inv(J22);  % Inverse of Jacobian matrix

end