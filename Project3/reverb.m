function y= reverb (x, room, mix)

y=zeros(length(x),1);
load rooms.mat;

if (room==1)
    y=conv(x,h1);
else if (room==2)
    y=conv(x,h2);
else
    y=conv(x,h3);
end

y=mixx(x, y,mix);

end