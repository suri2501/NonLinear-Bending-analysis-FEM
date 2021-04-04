function [tangent,stiffness,force] = Constraints(tangent,stiffness,force,bcdof)

% keyboard

% bcval = zeros(1,length(bcdof));
% 
% for ii=1:length(bcdof);
%     c = bcdof(ii);
%    
% 	tangent(c,:)=0;
% 	tangent(:,c)=0;
%     tangent(c,c) = 1;
%     
%     stiffness(c,:) = 0;
%     stiffness(:,c) = 0;
% 	stiffness(c,c) = 1;
% 
%     force(c) = bcval(ii);
% end

bcwt = mean(diag(tangent));
tangent(bcdof,:) = 0;
tangent(:,bcdof) = 0;
tangent(bcdof,bcdof) = bcwt*eye(length(bcdof));

bcwt = mean(diag(stiffness));
stiffness(bcdof,:) = 0;
stiffness(:,bcdof) = 0;
stiffness(bcdof,bcdof) = bcwt*eye(length(bcdof));

force(bcdof) = 0;

end


% f=f-K(:,udofs)*uFixed';  % modify the  force vector
% f(udofs) = bcwt*uFixed;
% bcwt=mean(diag(K));
% K(udofs,:)=0;  % zero out the rows and  columns of the K matrix
% K(:,udofs)=0;
% K(udofs,udofs)=bcwt*speye(length(udofs));  % put ones*bcwt on the diagonal
