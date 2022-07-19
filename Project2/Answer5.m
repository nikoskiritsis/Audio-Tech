x=audioread('C:\Users\LAPTOP\Downloads\voice1.wav');
x2=audioread('C:\Users\LAPTOP\Downloads\voice2.wav');
x3=audioread('C:\Users\LAPTOP\Downloads\voice2align.wav');
X=frame_wind(x,256,0.5);
X2=frame_wind(x,256,0.5);
X3=frame_wind(x,256,0.5);
[frame,N]=size(X);
[frame2,N2]=size(X2);
[frame3,N3]=size(X3);
spectrogram(x2,'yaxis');
title('spectrogram voice2');
figure;
spectrogram(x3,'yaxis');
title('spectrogram voice2align');


%A1 G1
for j=1:N
A1(j,:) = lpc(X(:,j),21);
end

for j=1:N 
R1(j,:) = xcorr(X(:,j));
end
 
G21=zeros(1,N);
for j=1:N
    for i=2:22 
        G21(j)=G21(j)+A1(j,i)*R1(j,frame+i-1);
    end
    G21(j)=R1(j,frame)-G21(j);
end
G1=sqrt(G21);

%e1
for i=1:21
 e1(:,i) = filter(A1(:,i),1,X(:,i));
end


%A2 G2
for j=1:N2
A2(j,:) = lpc(X2(:,j),21);
end

for j=1:N2 
R2(j,:) = xcorr(X2(:,j));
end
 
G22=zeros(1,N2);
for j=1:N2
    for i=2:22 
        G22(j)=G22(j)+A2(j,i)*R2(j,frame+i-1);
    end
    G22(j)=R2(j,frame)-G22(j);
end
G2=sqrt(G22);
%e2
for i=1:21
 e2(:,i) = filter(A2(:,i),1,X2(:,i));
end
%HZ2
HZ2=zeros(frame2,N2);
for j=1:21
 HZ2(:,i)=filter(G22(i),A2(i,:),E(:,i));
end
ye1 = frame_recon(HZ2,0.5);
soundsc(ye1,8000);
%HZ1
HZ1=zeros(frame,N);
for j=1:21
 HZ1(:,i)=filter(G1(i),A1(i,:),E(:,i));
end
ye2 = frame_recon(HZ1,0.5);
soundsc(ye2,9000)
