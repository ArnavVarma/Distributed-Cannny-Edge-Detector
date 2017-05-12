function y=hy_th(im,t1,t2)
[m,n]=size(im);
t=zeros(m,n);
%Edge thresholding
for i=1:m
    for j=1:n
        if(im(i,j)>=t1)
            t(i,j)=1;
        else
            if(im(i,j)>=t2)
            t(i,j)=2;
            end
        end
    end
end
y=zeros(m,n);
t=padarray(t,[1 1],'symmetric');
%Edge tracking
for i=2:m+1
    for j=2:n+1
        if(t(i,j)==2)
            temp=t(i-1:i+1,j-1:j+1);
            s=sum(sum(temp));
            if((s==18)||(s==2))
                y(i-1,j-1)=0;
            else
                y(i-1,j-1)=1;
            end
        else
            y(i-1,j-1)=t(i,j);
        end
    end
end
end



            