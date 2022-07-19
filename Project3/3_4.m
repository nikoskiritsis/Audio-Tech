x=audioread('C:\Users\LAPTOP\Documents\guitar1.wav');
room=2;
mix=0.4;

y=reverb(x,room,mix);

soundsc(y,16000);