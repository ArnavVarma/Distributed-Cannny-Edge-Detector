function y=yf(s,size)
n=(size-1)/2;
y=zeros(size,size);
for i=-n:n
    for j=-n:n
        y(i+n+1,j+n+1)=-j*exp((-i*i-j*j)/(2*s*s))/(s*s);
    end
end
end

        