function z = mixx (x,y, mix )

z=zeros(length(x),1);
for i=1:length(x)
z(i)=(1-mix)*x(i)+y(i)*mix;
end

end