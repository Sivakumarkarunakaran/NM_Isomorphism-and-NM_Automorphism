function [EXIST,Time]=ISO_GEN(Z)
% This is used to identify the isomorphic graphs from collection of
% undirected unweighted simple graph on n vertices. Here Z is the
% collection of symmetric adjacency matrix 
tic
Y=1:length(Z);ct=1;
while(1)
    t=[];
    for i=2:length(Y)           
        i
        j=graphisomorphism(sparse(Z{Y(1)}),sparse(Z{Y(i)}));
        if j==1
            t=[Y(i),t];
        end
    end
    EXIST{ct}=[Y(1),t];
    Y=setdiff(Y,[Y(1),t]);
    ct=ct+1;
    if length(Y)<=1
        if length(Y)==1
            EXIST{ct}=Y;
        end
        break
    end
end
Time=toc;
