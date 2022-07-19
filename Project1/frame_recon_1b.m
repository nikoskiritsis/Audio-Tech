function [ y ] = frame_recon( X,ovrlp )
[e,f]=size(X);
y= zeros(ovrlp*e*f,1);
l=0;
for i=1:e*ovrlp
    y(i,1)=X(i,1);
end
for j=2:f-1
    l=l+e*ovrlp;
    for i=1:e*ovrlp
        y(l+i,1)=X(e*ovrlp+i,j-1)+X(i,j);
    end
end
j=j+1;
l=l+e*ovrlp;
for i=1:e*ovrlp
    y(l+i,1)=X(e*ovrlp+i,j);
end
end