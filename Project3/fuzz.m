function z = fuzz (x, a, mix )

y=zeros(length(x),1);
for i=1:length(x)
y(i)=sign(x(i))*(1-exp(-a*x(i)*sign(x(i))));
end

z=mixx(x,y,mix);

end