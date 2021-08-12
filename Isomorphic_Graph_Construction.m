function [IsoMatrix, p]=Isomorphic_Graph_Construction(A)
% This is used to construct the isomorphic graph corresponding to given A
% A is symmetric adjacency matrix
n=size(A,1);
[a, b]=find(triu(A)==1);
ks=[a b];
p=randperm(n);
y=changem(ks,p,1:n);
IsoMatrix=eList_to_Amatrix(n,y);
return

