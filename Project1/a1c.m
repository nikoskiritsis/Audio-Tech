x=audioread('C:\Users\LAPTOP\Downloads\guit2.wav');
frame=256;
ovrlp=0.5;
X=frame_wind(x,frame,ovrlp);
y=frame_recon(X,ovrlp);
soundsc(x,16000);
soundsc(y,16000);
