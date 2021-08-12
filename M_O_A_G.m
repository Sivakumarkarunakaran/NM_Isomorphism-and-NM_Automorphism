function X = M_O_A_G(S,h,fx)        
% To find the optimal options of the automorphism group for given graph.
% Input: S Structural descriptor sequence corresponding to given graph, fx?Set of
% vertices in the connected component and h?the unique values of RG(fx)
jt=1;
for i=1:length(h)
    v=fx(find(S(fx)==h(i)));
    if length(v)>1
        clear f
        f=perms(v);
        ct=1;
        for i=1:size(f,1)    
            clear x
            x=find((v-f(i,:))~=0);
            if length(x)~=0
                G{ct}=[v(x); f(i,x)]';
                ct=ct+1;
            end
        end
        U{jt}=G;
        jt=jt+1;
        clear G 
    end
end
if length(U)==1
    X=U{:};
else
    ct=1;
    X=U{1};
    Y=U{2};
    while(1)    
        bt=1;
        for i=1:length(X)
            for j=1:length(Y)
                RX{bt}=[X{i}; Y{j}];
                bt=bt+1;
            end
        end
        X=[X Y RX];
        ct=ct+1;
        clear RX
        if ct==length(U)        
            break
        end
        Y=U{ct+1}    ;
    end
end
    
    
        

   

