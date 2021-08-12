function C=eList_to_Amatrix(n,k)
C=zeros(n);
for i=1:size(k,1)
    C(k(i,1),k(i,2))=1;
    C(k(i,2),k(i,1))=1;
end
