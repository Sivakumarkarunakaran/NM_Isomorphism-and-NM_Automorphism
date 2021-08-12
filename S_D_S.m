function [SA,n]=S_D_S(A,Irr) 
% To Find the Structural Descriptor Sequence corresponding to the given
% undirected unweighted simple graph G on n vertices using the sequence of powers of
% NM(G)  A is Adjacency matrix corresponding to the graph G and Irr? is a set of (n ? 1)
% irrational numbers, where Irr = sqrt(2), sqrt(3), sqrt(5),...
% https://arxiv.org/pdf/1906.07394.pdf
% Efficient Structural Descriptor Sequence to Identify Graph Isomorphism
% and Graph Automorphism
[ k, SPG, n]=SP_NM(A);
for l=1:k
    Deg=abs(diag(SPG(:,:,l)));
    for j=1:n       
        X=SPG(j,:,l);        
        X(j)=0;  
        g1=find(X>0);        
        g2=find(X<0);                  
        W_1=[X(g1) ; Deg(g1)'-SPG(j,g1,l);g1] ;
        s1=sort(sum([(W_1(1,:))/sqrt(7);(W_1(2,:)+sqrt(3))/sqrt(11)]));
        if length(g2)==0                    
            W_2=0;
            s3=0;            
        else
            er=SPG(g2,g2,l);
            er(er<0)=0;
            er(er>0)=1;
            er=sum(er);                
            W_2=[abs(X(g2)); er; (Deg(g2)'+SPG(j,g2,l))-er;g2];
           s3=sort(sum([(W_2(1,:))/sqrt(13);(W_2(2,:)+sqrt(3))/sqrt(17);(W_2(3,:)+sqrt(3))/sqrt(19)]));  
        end        
        VX(j)=sum(s1./Irr(1:length(s1))) + sum(s3./Irr(1:length(s3)));        
        clear s1 s3 er W_1 W_2 g1 g2 X s2 s4
    end
    T(l,:)=VX/Irr(l);
    clear VX 
end
if k==1
    SA=T;
else
    SA=sum(T);
end    
return
