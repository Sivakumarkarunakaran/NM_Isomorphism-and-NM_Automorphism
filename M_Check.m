function R=M_Check(O_T,n,Irr)
FG=[];
for i=1:length(O_T)    
    FG=[FG ; O_T{i}];    
end
R=zeros(1,n);
h=size(FG,1);
for i=1:h
    if nnz(FG(i,:))>0
        R=R+(FG(i,:)/Irr(i));
    end
end

    