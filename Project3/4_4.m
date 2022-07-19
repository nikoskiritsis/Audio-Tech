x=audioread('C:\Users\LAPTOP\Documents\vocals.wav');
room=2;
mix=0.5;
y1=reverb (x, room, mix);
f_sine=0.4;
delay=20;
depth=3;
mix=0.5;
fs=16000;
y2=chorus (y1, f_sine, delay, depth,mix, fs);
gain=25;
mix=1;
y=fuzz (y2, gain, mix);

soundsc(y,16000);
