function  n = nonlinear (x , gn , gp, mix)
n = zeros(length(x),1);
kp = 2;
kn = 2;
if(length(x)> kp) 
    n = tanh(kp) - ((((tanh(kp))^2 - 1)/gp)*tanh(gp*length(x)-kp));
end
if(-kn<=length(x)<=-kp)
        n = tanh(length(x));
end
if(length(x)<-kn)
         n = -tanh(kn) - ((((tanh(kn))^2 - 1)./gn)*tanh(gn*length(x)+kn));
end
         
end