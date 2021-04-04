function [Gausspoint,Gaussweight] = GaussQuadrature(order)
[x,w] = lgwt(order,-1,1);
% [x,w] = lglnodes(order-1);
Gausspoint = [flipud(x),flipud(x)];
Gaussweight = [flipud(w),flipud(w)];
end