%a
x=audioread('C:\Users\LAPTOP\Downloads\guit2.wav');
frame=256;
ovrlp=0.5;
X=frame_wind(x,frame,ovrlp);
E=enframe(X);
%b
plot(E);
%c
Y=as4(x,E);
%d
y=frame_recon(Y,ovrlp);
soundsc(y,16000);
