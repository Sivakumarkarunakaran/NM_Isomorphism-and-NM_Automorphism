function [ k, SPG, n]=SP_NM(A)
% This algorithm used to construct the sequence of power of neighbourhood
% matrix corresponding to given symmetric adjacency matrix.
% Details of algorithm can get from https://doi.org/10.1007/s42452-020-2635-1
l=1; 
n=length(A);
b=0;
SPG=zeros(n);
while(1) 
    clear AL
    AL=A*(diag(sum(A))-A);           
    a=nnz(AL);      
    %SPG(:,:,l)=AL;    
    if a==n^2   
        SPG(:,:,l)=AL;            
        k=l;
        break 
    elseif isequal(a,b)==1        
        k=l-1;
        break
    else
        SPG(:,:,l)=AL;    
        b=a;      
        clear A
        A=AL;        
        A(A~=0)=1;
        for p=1:n
            A(p,p)=0;
        end         
        l=l+1;
    end               
end  
   
