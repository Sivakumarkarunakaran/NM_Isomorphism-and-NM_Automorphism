function [SA,Z,R]=Clique_Sequence(A,Irr)
% This is used to construct the unique sequence corresponding to given
% adjacency matrix. Here we using clique concept and structural descriptor
% sequence to construct unique irrational number sequence.
% https://arxiv.org/pdf/1906.07394.pdf
% Efficient Structural Descriptor Sequence to Identify Graph Isomorphism
% and Graph Automorphism

n=size(A,1);Z=zeros(1,n);
[X,Y]=Complete_Cliques_1(A);
R=M_Check(X,n,Irr);
[SA,n]=S_D_S(A,Irr) ;
ct=1;
for i=1:size(Y,1)
    for j=1:size(Y,2)
        a=0;b=0;
        if size(Y{i,j},1)>0
            a=sum(sort(R(Y{i,j}),2)');
            b=sum(sort(a));
        end
        Z(ct)=b;
        ct=ct+1;
    end
end

