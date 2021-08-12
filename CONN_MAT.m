function A=CONN_MAT(n,e)
nargin
% Example A=CONN_MAT(10,15), n>0 (n is integer), e<=nchoose(n,2)
% This algorithm used to construct the symmetric adjacency matrix corresponding to
% the connected graph on n vertices and e edges. This code construct the
% connected graph
x=(n*(1:n-1))+[(1:n-1)];
u=[];
for i=1:(n-1)
    u=[u [1:i]+(i*n)];
end
gx=setdiff(u,x);
elist=[randsample(gx,(e-n+1)) x];
A=zeros(n);
A(elist)=1;
A=A+A';
return
