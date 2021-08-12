function [D_O_I,OUT]=Complete_Cliques_1(A)
% To find all possible distinct complete subgraph of given graph G.
% Input: A is Adjacency matrix corresponding to given graph G.
n=size(A,1);e=1:n;tq=[];
[a,b,c,d,LK1,LK2,LK3,LK4,JX]=Cliques_1(A,e,tq);
ct=1;
D_O_I{ct}=[a;b;c;d];OUT{ct,1}=LK1;OUT{ct,2}=LK2;OUT{ct,3}=LK3;OUT{ct,4}=LK4;
if length(JX)==0
    return
end
ct=2;
while(1)
    if length(JX)==0
        break
    end
    clear a b c LK2 LK3 LK4 F l m uy
    a=zeros(1,n); b=a; c=b; d=a; F=[];
    LK1=[];LK2=[];LK3=[];LK4=[];        
    for i=1:size(JX,1)        
        clear C ac bc cc LK2c LK3c LK4c JXc  po dc LK1c       
        e=JX{i,2};tq=setdiff(JX{i,3},e);
        [ac,bc,cc,dc,LK1c,LK2c,LK3c,LK4c,JXc]=Cliques_1(A,e,tq);
        a(JX{i,2})=a(JX{i,2})+ac;
        b(JX{i,2})=b(JX{i,2})+bc;
        c(JX{i,2})=c(JX{i,2})+cc;
        d(JX{i,2})=d(JX{i,2})+dc;
        jp=size(JX{i,1},1);
        a(JX{i,1})=a(JX{i,1})+(size(LK1c,1)*ones(1,jp));
        b(JX{i,1})=b(JX{i,1})+(size(LK2c,1)*ones(1,jp));
        c(JX{i,1})=c(JX{i,1})+(size(LK3c,1)*ones(1,jp));            
        d(JX{i,1})=d(JX{i,1})+(size(LK4c,1)*ones(1,jp));            
        
        po=JX{i,1};
        tr=size(JX{i,2},2);
        z=[];u=[];v=[];w=[];
        if size(LK1c,1)>0
            z=repmat(po,size(LK1c,1),1);
        end
        if size(LK2c,1)>0
            u=repmat(po,size(LK2c,1),1);
        end
        if size(LK3c,1)>0
            v=repmat(po,size(LK3c,1),1);
        end
        if size(LK4c,1)>0
            w=repmat(po,size(LK4c,1),1);
        end
        LK1=[LK1; [z changem(LK1c,JX{i,2},1:tr)]];
        LK2=[LK2; [u changem(LK2c,JX{i,2},1:tr)]];
        LK3=[LK3; [v changem(LK3c,JX{i,2},1:tr)]];
        LK4=[LK4; [w changem(LK4c,JX{i,2},1:tr)]] ; 
        for t=1:size(JXc,1)
            clear yk
            JXc{t,1}=[JX{i,1}, changem(JXc{t,1},JX{i,2},1:tr)];
            JXc{t,2}=changem(JXc{t,2},JX{i,2},1:tr);                 
            JXc{t,3}=[tq(find(sum(A(JXc{t,1},tq))==length(JXc{t,1}))), changem(JXc{t,3},JX{i,2},1:tr)];
        end
        F=[F;JXc] ;    
    end
    a=a+D_O_I{ct-1}(4,:); D_O_I{ct-1}(4,:)=[];
    D_O_I{ct}=[a;b;c;d];OUT{ct,1}=[OUT{ct-1,4};LK1]; OUT{ct,2}=LK2;OUT{ct,3}=LK3;OUT{ct,4}=LK4;
    OUT{ct-1,4}=[];
    ct=ct+1;
    clear JX
    JX=F;
end
if size(OUT{ct-1,4},1)~=0
    OUT{ct,1}=OUT{ct-1,4};
    OUT{ct-1,4}=[];
end
return


    
    
    