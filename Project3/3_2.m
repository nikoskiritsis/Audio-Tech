x=audioread('C:\Users\LAPTOP\Documents\guitar1.wav');
room=1;
mix=0.5;

y=reverb(x,room,mix);

soundsc(y,16000);