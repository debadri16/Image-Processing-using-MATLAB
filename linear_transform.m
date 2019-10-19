x=imread('low_contrast_cameraman.pgm');
imhist(x);
rmax=0;
rmin=256;
for i=1:256
    for j=1:256
        if(x(i,j)<rmin)
            rmin=x(i,j);
        end
        if(x(i,j)>rmax)
            rmax=x(i,j);
        end
    end
end
y=zeros(256,'uint8');
for i=1:256
    for j=1:256
        y(i,j)=(255/(rmax-rmin))*(x(i,j)-rmin);
    end
end
z = zeros(256,1);
t=zeros(256,1);
for i=1:256
    t(i)=i-1;
end
for i=1:256
    for j=1:256
        z(y(i,j)+1,1)=z(y(i,j)+1,1)+1;
    end
end
figure(2);
plot(t,z);

