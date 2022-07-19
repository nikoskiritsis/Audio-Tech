x=audioread('C:\Users\LAPTOP\Documents\vocals.wav');
room=3;
mix=0.3;

y=reverb(x,room,mix);

soundsc(y,16000);