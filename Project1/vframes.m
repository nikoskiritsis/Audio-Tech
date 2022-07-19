function [ Xv ] = vframes( X,voice )
[a,b]=size(X);
Xv=zeros(a,b);
for j =1:b
    if voice(j)==1
        for i=1:a
            Xv(i,j)=X(i,j);
        end
    end
end
end