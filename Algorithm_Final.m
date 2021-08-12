function [SEM,Ach1,Ac1,Tm]=Algorithm_Final(X,n)
% This is the final algorithm to identify the isomorpthic graphs in family of graphs
% Here X contains more than one symmetric adjacency matrix and n is the
% number of vertices
% https://arxiv.org/pdf/1906.07394.pdf
% Efficient Structural Descriptor Sequence to Identify Graph Isomorphism
% and Graph Automorphism

tic
Irr=sqrt(primes(nthprime(n)));
for i=1:length(X)    
    i
    clear A Z SA    
    A=X{i};
    [SA,Z]=Clique_Sequence(A,Irr);
    Ach1(i,:)=SA;
    Ac1(i,:)=Z;
end
U=[sort(Ach1,2) Ac1];
[x,y,z]=unique(U,'rows');
    mult=nonzeros(accumarray(z(:),1,[],@sum,0,true));
    tu=find(mult==1); jl=y(tu);
for i=1:length(tu)
    SEM{i}=y(tu(i));
end
ZT=find(mult>1);
for i=1:length(ZT)    
    clear ft OUT XK MA NO 
    ft=find(z==ZT(i));
    for j=1:length(ft)       
        MA{j}=X{ft(j)};
    end    
    OUT=DATA_SET_GEN(MA,ft);
    SEM=[OUT,SEM];
end
Tm=toc;     
