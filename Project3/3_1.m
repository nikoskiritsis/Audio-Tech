x=audioread('C:\Users\LAPTOP\Documents\guitar1.wav');
room=1;
mix=1;

y=reverb(x,room,mix);

soundsc(y,16000);