function [ ZCR ] = zecrora( X )
[a,b]=size(X);
for j=1:b
    sum=0;
    for i=2:a
        sum=sum+abs(sign(X(i,j))-sign(X(i-1,j)));
    end
    ZCR(j)=sum;
end
end