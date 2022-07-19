function [ X ] = frame_wind( x,frame,ovrlp )
[a,b]=size(x);
c=a/(ovrlp*frame);
c=int16(c);
k=-frame*ovrlp;
X=zeros(frame,c);
p=zeros(frame,c);
    for j=1:c
       if j==c-1
           break;
       end
        k=k+frame*ovrlp; 
        for i=1:frame
            p(i,j)=x((k+i),1);
        end
    end
    d=hamming(frame);
    for j=1:c
        for i=1:frame
            X(i,j)=p(i,j).*d(i,1);
        end
    end
end