function[Qb,Qs,Q] = ReducedStiffness(E1,E2,NU12,NU21,G12,G13,G23)
Q = zeros(5);
Qb = zeros(3);
Qs = zeros(2);

% Sequence of stresses taken - [sigmaxx, sigmayy, sigmaxy, sigmayz, sigmaxz]

Q11=E1/(1-NU12*NU21);
Q12=NU12*E2/(1-NU12*NU21);
Q22=(E2/(1-NU12*NU21));
Q66=G12;

Q44=G23;
Q55=G13 ;

Q=[Q11 Q12 0    0    0;
   Q12 Q22 0    0    0;
    0   0  Q66  0    0;
    0   0   0  Q44   0;
    0   0   0   0   Q55];
    
Qb = Q(1:3,1:3);
Qs = Q(4:5,4:5);
end