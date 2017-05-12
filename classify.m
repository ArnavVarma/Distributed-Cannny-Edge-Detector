function y=classify(im)
[m,n]=size(im);
np=zeros(3);
img=padarray(im,[1 1],'symmetric');
te=900;
tu=100;
%Pixel classification
for i=2:m+1
    for j=2:n+1
        temp=img(i-1:i+1,j-1:j+1);
        mu=sum(sum(temp))/9;
        s=sqrt(sum(sum(temp-mu).^2)/9);
        if(s<=tu)
            np(1)=np(1)+1;
        elseif((s<=te)&&(s>=tu))
            np(2)=np(2)+1;
        else
            np(3)=np(3)+1;
        end
    end
end
%block classification
if(np(3)==0)
    if(np(1)<0.3*m*n)
        y=2;
    else
        y=1;
    end
else
    if(np(3)<0.3*m*n)
        if(np(1)<0.65*m*n)
            y=3;
        else
            y=4;
        end
    else
        if(np(1)<0.7*m*n)
            y=5;
        end
    end
end
end


        
        
        
        
       