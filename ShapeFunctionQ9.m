function [R,dRdxi,dRdeta] = ShapeFunctionQ9(xi,eta)

% 3----------6---------9
% |                    |
% |                    |
% |                    |
% |                    |
% 2          5         8
% |                    |
% |                    |
% |                    |
% |                    |
% 1----------4---------7

R=1/4*[xi*eta*(xi-1)*(eta-1);
    -2*xi*(xi-1)*(eta+1)*(eta-1);
    xi*eta*(xi-1)*(eta+1);
    -2*eta*(xi+1)*(xi-1)*(eta-1);
    4*(xi+1)*(xi-1)*(eta+1)*(eta-1);
    -2*eta*(xi+1)*(xi-1)*(eta+1);
    xi*eta*(xi+1)*(eta-1);
    -2*xi*(xi+1)*(eta+1)*(eta-1);
    xi*eta*(xi+1)*(eta+1)];

%---------natural derivative-------------
dRdxi=1/4*[eta*(2*xi-1)*(eta-1);
   -2*(2*xi-1)*(eta+1)*(eta-1);
    eta*(2*xi-1)*(eta+1);
   -4*xi*eta*(eta-1);
     8*xi*(eta^2-1);
     -4*xi*eta*(eta+1);
     eta*(2*xi+1)*(eta-1);
     -2*(2*xi+1)*(eta+1)*(eta-1);
    eta*(2*xi+1)*(eta+1)];
 
dRdeta=1/4*[xi*(xi-1)*(2*eta-1);
     -4*xi*eta*(xi-1);
     xi*(xi-1)*(2*eta+1);
     -2*(xi+1)*(xi-1)*(2*eta-1);
      8*eta*(xi^2-1);
      -2*(xi+1)*(xi-1)*(2*eta+1);
      xi*(xi+1)*(2*eta-1);
       -4*xi*eta*(xi+1);
       xi*(xi+1)*(2*eta+1)];

end