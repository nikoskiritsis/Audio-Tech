function z= chorus (x, f_sine, delay, depth, mix, fs)

BL=0.7;
FB=-0.7;
FF=1;
n=length(x);
del=ceil(delay+depth);
y=zeros(n,1);
xh=zeros(n,1);
M=zeros(n,1);

for i=del:n
    M(i)=round(delay+depth*(0.5+0.5*sin(2*pi*f_sine*(i/fs))));
    xh(i)=x(i)+FB*xh(n-M(i));
    y(i)=BL*xh(i)+FF*xh(i-M(i));
end

z=mixx(x, y, mix);
