x=wavread('C:\Users\LAPTOP\Documents\guitar_kids.wav');
%spectogram prin to chorus
s1 = spectrogram(x);
figure(1)
plot(s1)
grid
%
f_sine=0.3;
delay=10;
depth=3;
mix=1;
fs=44100;

y=chorus(x, f_sine, delay, depth, mix, fs);
%spectogram meta to chorus
s2 = spectrogram(y);
figure(2)
plot(s2)
grid
%

soundsc(y,44100);