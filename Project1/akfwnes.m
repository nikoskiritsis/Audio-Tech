function [ voice ] = akfwnes( E,ZCR,a,b )
[y,w]=size(E);
voice=zeros(1,w);
M=max(E);
M1=max(ZCR);
for i=1:w
    if (E(i)<a*M && ZCR(i)>b*M1)
        voice(i)=0 ;
        else voice(i)=1 ;
    end
end
end