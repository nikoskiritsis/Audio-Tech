function [ Xu ] = uframes ( X,voice )
[a,b]=size(X);
Xu=zeros(a,b);
for j =1:b
    if voice(j)==0
        for i=1:a
            Xu(i,j)=X(i,j);
        end
    end
end
end