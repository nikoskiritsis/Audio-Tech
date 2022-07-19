function [ E ] = enframe( X )
[a,b]=size(X);
for j=1:b
    sum=0;
    for i=1:a
        sum=sum+(X(i,j))^2;
    end
    E(j)=sum;
end
end