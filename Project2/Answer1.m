x=audioread('C:\Users\LAPTOP\Documents\MATLAB\voice.wav');
X=frame_wind(x,256,0.5);
[frame,N]=size(X);
 
for j=1:N
A(j,:) = lpc(X(:,j),21);
end
 
for j=1:N 
R(j,:) = xcorr(X(:,j));
end
 
G2=zeros(1,N);
for j=1:N
    for i=2:22 
        G2(j)=G2(j)+A(j,i)*R(j,frame+i-1);
    end
    G2(j)=R(j,frame)-G2(j);
end
G=sqrt(G2);

