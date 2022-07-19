x=audioread('C:\Users\LAPTOP\Documents\guitar1.wav');
%spectogram tou x
s1 = spectrogram(x);
figure(1)
plot(s1)
grid
%
gain=5;
mix=1;
y=fuzz(x,gain,mix);
%spectogram meta to fuzz
s2 = spectrogram(y);
figure(2)
plot(s2)
grid
%
soundsc(y,16000);
gn=5;
gp=5;
z = nonlinear(x,gn,gp,mix);
