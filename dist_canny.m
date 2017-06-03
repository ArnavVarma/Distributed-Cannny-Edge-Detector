function y = dist_canny(name)
im=imread(name); %Image to be input
im=rgb2gray(im);
figure(1);
imshow(im);
s = size(im);
t = rem(s,64) - 32 > 0 ;
s = s - - 1 .^t .* ( t * 64 + -1 .^ (1-t) .* rem(s,64));
im=imresize(im,s); %Set based on nearest multiple of 64     
[r,c]=size(im);
e_i=zeros(r,c);
fsize=3;
n=64;
m=n+fsize+1;
im=padarray(im,[(m-n)/2 (m-n)/2],'symmetric');
sigma=1.4;
temp=zeros(m,m);
hx=xf(sigma,fsize);
hy=yf(sigma,fsize);
im=double(im);
cnt = 0;
for i=1+(m-n)/2:n:r+(m-n)/2-n+1
    for j=1+(m-n)/2:n:c+(m-n)/2-n+1
        cnt = cnt + 1;
        temp=im(i:i+n-1,j:j+n-1);
        t=classify(temp);
        temp=im(i-(m-n)/2:i+n+(fsize-1)/2,j-(m-n)/2:j+n+(fsize-1)/2);
        gx=imfilter(temp,hx);
        gy=imfilter(temp,hy);
        g=(gx.^2+gy.^2).^0.5;
        theta=atan(gy./gx);
        g1=nms(g,theta);   %Non maximum suppression
        [t1,t2]=atc(g1,t); %Adaptive threshold calculation
        g2=hy_th(g1,t1,t2);
        %reconstruction
        e_i(i:i+n-1,j:j+n-1)=g2(1+(fsize+1)/2:m-(fsize+1)/2,1+(fsize+1)/2:m-(fsize+1)/2); %changing mxm block to nxn
    end
end
y = e_i;
figure(2);
imshow(e_i);
end