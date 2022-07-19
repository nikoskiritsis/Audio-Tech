clear;
clc;
x=audioread('C:\Users\LAPTOP\Downloads\guit2.wav');
X=frame_wind(x,256,0.5);
[A B]=size(X);
imagesc(abs(fft(X)));title('ola');
Y=fft(X);
for i=1:B
    NewY(1:A/2,i)=Y(1:A/2,i);
end
figure;
imagesc(abs(NewY));title('misa');
figure;
p=1;
for i=1:A
    for j=1:B
        S(p)=Y(i,j);
        p=p+1;
    end
end
spectrogram(S);title('ola apo spectogram');figure
p=1;
for i=1:A/2
    for j=1:B
        S2(p)=  NewY(i,j);
        p=p+1;
    end
end
spectrogram(S2);title('misa apo spectogram');
y=frame_recon(X,0.5);
soundsc(y,16000);
soundsc(x,16000);