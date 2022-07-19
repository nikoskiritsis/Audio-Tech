x=audioread('C:\Users\LAPTOP\Documents\MATLAB\voice.wav');
X=frame_wind(x,256,0.5);
[frame,N]=size(X);
for i=1:21
 e(:,i) = filter(A(:,i),1,X(:,i));
end
y1 = frame_recon(e,0.5);
%soundsc(y1,16000);
HZ=zeros(frame,N);
for j=1:21
 HZ(:,i)=filter(G(i),A(i,:),E(:,i));
end
ye = frame_recon(HZ,0.5);
soundsc(ye,16000);

%b
x=audioread('C:\Users\LAPTOP\Documents\MATLAB\recording3.wav');
%A
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
%B
E=zeros(1,N);
for j=1:N
    for i=1:256
        E(j)=(X(i,j)^2)+E(j);
    end
end

ZCR=zeros(1,N);
for j=1:N
    for i=2:256
        ZCR(j)=abs(sign(X(i,j))-sign(X(i-1,j)))+ZCR(j);
    end
end

maxE=max(E);
maxZCR=max(ZCR);

for j=1:N
    if(( E(j)<(0.4*max(E)))&&(ZCR(j)>(0.4*max(ZCR))))
        X(:,j)=0; 
    else
        X(:,j)=1;
    end
end
 
un=00.1*randn(frame,1);

vo=abs(diff(sign(sin(pi*125*(0:frame)/16000))));

for j=1:N
    if (X(1,j)==0)
        e(:,j)=un;
    end
    if (X(1,j)==1)
        e(:,j)=vo;
    end
end

for j=1:N 
    X(:,j)=filter(G(j),A(j,:),e(:,j));
end

y=frame_recon(X,0.5);
soundsc(y,16000);
%C
for i=1:21
 e(:,i) = filter(A(:,i),1,X(:,i));
end
y1 = frame_recon(e,0.5);
%soundsc(y1,16000);
HZ=zeros(frame,N);
for j=1:21
 HZ(:,i)=filter(G(i),A(i,:),E(:,i));
end
ye = frame_recon(HZ,0.5);
soundsc(ye,16000)

