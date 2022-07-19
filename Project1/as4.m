function [ Y ] = as3( S,E )
[a,b]=size(S);
Y=zeros(a,b);
energa_frames=0;
anenerga_frames=0;
pososto=0;
for i=1:b
    if (E(1,i)>=0.2 )
        energa_frames=energa_frames+1;
        for j=1:a
            Y(i,j)=X(i,j) ;
        end
    else
        anenerga_frames=anenerga_frames+1;
    end
end        
athroisma=energa_frames+anenerga_frames;
pososto=(anenerga_frames./athroisma)*100;
end