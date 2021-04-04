function [Qbarb,Qbars,Qbar] = TransformedReducedStiffness(Q_bending,Q_shear,theta)
m = cos(theta*pi/180);
n = sin(theta*pi/180);

% Qbar matrix for orthotropic lamina
% Qbar = [Q11 Q12 Q16 0   0;
%         Q12 Q22 Q26 0   0;
%         Q16 Q26 Q66 0   0;
%          0   0   0 Q44 Q45;
%          0   0   0 Q45 Q55];
% T_bending = [m*m n*n -2*m*n ; n*n m*m 2*m*n ; m*n -m*n m*m-n*n];
% T_shear = [m n ; -n m];

%%
R_b = [1 0 0;
            0 1 0;
            0 0 2];
Rinv_b = inv(R_b);

T_b = [m*m n*n 2*m*n ; n*n m*m -2*m*n ; -m*n m*n m*m-n*n];
Tinv_b = inv(T_b);

Qbarb = Tinv_b*Q_bending*R_b*T_b*Rinv_b;

%%
R_s = [2 0;0 2];
Rinv_s = inv(R_s);

T_s = [m -n ; n m];    
Tinv_s = inv(T_s);

Qbars = Tinv_s*Q_shear*R_s*T_s*Rinv_s;

%%
Qbar = zeros(5);
Qbar(1:3,1:3)= Qbarb;
Qbar(4:5,4:5)= Qbars;

end