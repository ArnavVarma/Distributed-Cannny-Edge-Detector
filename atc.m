function [ht,lt]=atc(im,t)
[m,n]=size(im);
%Step 1:
if(t==1)
    p1=0;
elseif(t==2)
    p1=0.03;
elseif(t==3)
    p1=0.1;
elseif(t==4)
    p1=0.2;
else
    p1=0.4;
end
%Step 2
gmax=max(max(im));
gmin=min(min(im));
r=zeros(8);
r(1)=0.5*(gmin+gmax);
for i=1:7
    r(i+1)=0.5*(r(i)+gmin);
end
his=zeros(8);
for i=1:m
    for j=1:n
        if(im(i,j)>r(1))
            his(8)=his(8)+1;
        elseif(im(i,j)>r(2))
            his(7)=his(7)+1;
        elseif(im(i,j)>r(3))
            his(6)=his(6)+1;
        elseif(im(i,j)>r(4))
            his(5)=his(5)+1;    
        elseif(im(i,j)>r(5))
            his(4)=his(4)+1;    
        elseif(im(i,j)>r(6))
            his(3)=his(3)+1;    
        elseif(im(i,j)>r(7))
            his(2)=his(2)+1;
        else
            his(1)=his(1)+1;
        end
    end
end
his=his/(m*n);
f=zeros(8);
f(1)=his(1);
for i=2:8
    f(i)=his(i)+f(i-1);
end
%Step 3
dis=zeros(8);
for i=1:8
    dis(i)=abs(f(i)-(1-p1));
end
[x,pos]=min(dis(i));
ht=r(pos);
%Step 4
lt=0.4*ht;
end



    
            
