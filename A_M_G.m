function A_G=A_M_G(A)
% To find the automorphism groups of given undirected unweighted simple graph.
% Input: Graph G, with adjacency matrix A.
% https://arxiv.org/pdf/1906.07394.pdf
% Efficient Structural Descriptor Sequence to Identify Graph Isomorphism
% and Graph Automorphism
n=length(A)
Irr=sqrt(primes(nthprime(n-1)));
[S, n]=S_D_S(A,Irr);
[Ta, Tb]=graphconncomp(sparse(A));
for i=1:max(Tb)
    clear fx R h Id C eL X  
    fx=find(Tb==i);
    h=unique(S(fx));
    Id=fx;
    asd=1;
    if length(h)~=length(fx)
        C=zeros(n);
        C(fx,fx)=A(fx,fx);
        [q1, q2]=find(triu(C)==1);        
        eL=sortrows([q1 q2]);
        X = M_O_A_G(S,h,fx);                
        for u=1:length(X) 
            clear f tL
            f=X{u};         
            tL=changem(eL,f(:,2),f(:,1));
            if isequal(eL,sortrows(sort(tL,2)))==1                        
                AMor{asd}=f; asd=asd+1;
            end            
        end        
    end
    AMor{asd}=[Id' Id'];
    A_G{i}=AMor;
    clear AMor
end
