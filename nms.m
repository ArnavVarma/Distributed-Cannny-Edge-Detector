function y=nms(im,theta)
[m,n]=size(theta);
y=zeros(m,n);
im=padarray(im,[1 1],'symmetric');
t=round(theta/(pi/4));
for i=2:m+1
    for j=2:n+1
        if((t(i-1,j-1)==2)||(t(i-1,j-1)==-2))
            if(im(i,j)~=max(im(i,j),max(im(i,j-1),im(i,j+1))))
                y(i-1,j-1)=0;
            else
                y(i-1,j-1)=im(i,j);
            end
        end
        if(t(i-1,j-1)==-1)
            if(((i~=2)&&(i~=m+1)&&(j~=2)&&(j~=n+1))||(((i==2)&&(j==2))||((i==m+1)&&(j==n+1)))||((i==m+1)&&(j==2))||((i==2)&&(j==n+1)))
                if(im(i,j)~=max(im(i,j),max(im(i-1,j+1),im(i+1,j-1))))
                    y(i-1,j-1)=0;
                else
                    y(i-1,j-1)=im(i,j);
                end
            elseif((i==m+1)||(j==2))
                    if(im(i,j)~=max(im(i,j),im(i-1,j+1)))
                        y(i-1,j-1)=0;
                    else
                        y(i-1,j-1)=im(i,j);
                    end
            else
                if(im(i,j)~=max(im(i,j),im(i+1,j-1)))
                    y(i-1,j-1)=0;
                else
                    y(i-1,j-1)=im(i,j);
                end
            end
        end
        if(t(i-1,j-1)==1)
            if(((i~=2)&&(i~=m+1)&&(j~=2)&&(j~=n+1))||(((i==2)&&(j==2))||((i==m+1)&&(j==n+1)))||((i==m+1)&&(j==2))||((i==2)&&(j==n+1)))
                if(im(i,j)~=max(im(i,j),max(im(i-1,j-1),im(i+1,j+1))))
                    y(i-1,j-1)=0;
                else
                    y(i-1,j-1)=im(i,j);
                end
            elseif((i==2)||(j==2))
                    if(im(i,j)~=max(im(i,j),im(i+1,j+1)))
                        y(i-1,j-1)=0;
                    else
                        y(i-1,j-1)=im(i,j);
                    end
            else
                if(im(i,j)~=max(im(i,j),im(i-1,j-1)))
                    y(i-1,j-1)=0;
                else
                    y(i-1,j-1)=im(i,j);
                end
            end
        end
        if(t(i-1,j-1)==0)
            if(im(i,j)~=max(im(i,j),max(im(i+1,j),im(i-1,j))))
                y(i-1,j-1)=0;
            else
                y(i-1,j-1)=im(i,j);
            end
        end
    end
end
end


        
        



        
    