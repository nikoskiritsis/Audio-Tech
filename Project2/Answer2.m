E=zeros(1,N);
for j=1:N
    for i=1:256
        E(j)=(X(i,j)^2)+E(j);
    end
end

ZCR=zeros(1,N);
for j=1:N
    for i=2:256
        ZCR(j)=abs(sign(X(i,j))-sign(X(i-1,j)))+ZCR(j);
    end
end

maxE=max(E);
maxZCR=max(ZCR);

for j=1:N
    if(( E(j)<(0.4*max(E)))&&(ZCR(j)>(0.4*max(ZCR))))
        X(:,j)=0; 
    else
        X(:,j)=1;
    end
end
 
un=00.1*randn(frame,1);

vo=abs(diff(sign(sin(pi*125*(0:frame)/16000))));

for j=1:N
    if (X(1,j)==0)
        e(:,j)=un;
    end
    if (X(1,j)==1)
        e(:,j)=vo;
    end
end

for j=1:N 
    X(:,j)=filter(G(j),A(j,:),e(:,j));
end

y=frame_recon(X,0.5);
soundsc(y,16000);