x=audioread('C:\Users\LAPTOP\Documents\guitar1.wav');
%spectogram tou x
s1 = spectrogram(x);
figure(1)
plot(s1)
grid
%
gain=25;
mix=0.5;
y=fuzz (x,gain,mix);
%spectogram meta to fuzz
s2 = spectrogram(y);
figure(2)
plot(s2)
grid
%
soundsc(y,16000);
gn=15;
gp=25;
z=nonlinear(x,gn,gp,mix);