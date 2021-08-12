function [a,b,c,d,LK1,LK2,LK3,LK4,JX]=Cliques_1(A,e,tq)
C=A(e,e); 
CL=C*(diag(sum(C))-C);
Deg=abs(diag(CL))'; 
n=size(C,1);
for i=1:n
    PTT{i}=find(C(i,:)>0);
end
clear i
LK1=[];LK2=[];LK3=[];LK4=[];JX=[];a=zeros(1,n);b=a;c=a;d=a;
at=1;bt=1;ct=1;dt=1;vt=1;
for i=1:n
    clear X g1 g2 P Q g1 a4 a5 a2 a3 g3 a9 a8 nr   
    g2=PTT{i}; 
    if length(g2)>0        
        g1=g2(g2>i);
        if length(g1)>0
            P=Deg(g1)-CL(i,g1); rj=g1(P==0);
            for ts=1:length(rj)                
                clear nr               
                nr=find(sum(A(e([i, rj(ts)]),tq))==2);
                if length(nr)==0
                    LK2(bt,:)=[i rj(ts)];
                    b(LK2(bt,:))=b(LK2(bt,:))+1;
                    bt=bt+1;
                end
            end
            g1=g1(P>0);
            if length(g1)>1
                [j, k]=find(triu(C(g1,g1))==1);         
                a4=[g1(j)' g1(k)']            ;
                clear j k 
                for u=1:size(a4,1)
                    clear  s  
                    s=Deg(a4(u,2))-CL(a4(u,1),a4(u,2));                                        
                    if s>1
                        clear a7 a8 tr a9
                        a7=intersect(PTT{a4(u,1)},PTT{a4(u,2)}) ;
                        a8=a7(find(C(i,a7)>0));
                        tr=length(a8);
                        if tr==1
                            a8=a8(a8>a4(u,2));
                            if length(a8)==1
                                clear  nr                                
                                nr=find(sum(A(e([i, a4(u,:), a8]),tq))==4);
                                if length(nr)==0
                                    
                                    LK4(dt,:)=[i, a4(u,:), a8];
                                    d(LK4(dt,:))=d(LK4(dt,:))+1;
                                    dt=dt+1;
                                end
                            end
                        elseif tr==0
                            clear  nr                                
                            nr=find(sum(A(e([i, a4(u,:)]),tq))==3);
                            if length(nr)==0
                                LK3(ct,:)=[i a4(u,:)];
                                c(LK3(ct,:))=c(LK3(ct,:))+1;
                                ct=ct+1;
                            end
                        else
                            clear a9
                            a9=a8(a8>a4(u,2));
                            if length(a9)>1                                 
                                JX{vt,1}=[i a4(u,:)];
                                JX{vt,2}=a9;
                                JX{vt,3}=a8;
                                vt=vt+1;
                             elseif length(a9)==1                                 
                                 if nnz(C(a9,a8))==0 
                                     clear  nr                                
                                     nr=find(sum(A(e([i, a4(u,:), a9]),tq))==4);
                                     if length(nr)==0                                         
                                         LK4(dt,:)=[i, a4(u,:), a9];
                                         d(LK4(dt,:))=d(LK4(dt,:))+1;
                                         dt=dt+1;
                                     end
                                 end
                            end                                                                                         
                        end
                    else                   
                        clear nr                                
                        nr=find(sum(A(e([i a4(u,:)]),tq))==3);
                        if length(nr)==0                            
                            LK3(ct,:)=[i a4(u,:)];
                            c(LK3(ct,:))=c(LK3(ct,:))+1;
                            ct=ct+1;                                                         
                        end
                    end
                end
            end
        end
    else        
        if nnz(A(e(i),tq))==0             
            LK1(at,:)=[i];
            a(LK1(at,:))=a(LK1(at,:))+1;
            at=at+1;            
        end
    end
end
return
