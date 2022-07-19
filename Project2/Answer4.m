x=audioread('C:\Users\LAPTOP\Documents\MATLAB\voice.wav');
X=frame_wind(x,256,0.5);
[frame,N]=size(X);
 
for j=1:N
A4(j,:) = lpc(X(:,j),35);
end

for i=10:35
    e(:,i) = filter(A4(:,i),1,X(:,i));
end

for i=1:35
    Ep=power(e,2);
end
plot(Ep);