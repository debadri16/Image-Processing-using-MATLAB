I = imread('lena.pgm');
[row,col] = size(I);
H = zeros(256, 1);
T=zeros(256, 1);
figure(1) , imshow(I);
for x=1:row
    for y=1:col
        H(I(x,y) + 1) = H(I(x,y) + 1) + 1;
    end    
end
for k=1:256
    p(k)=double(H(k)/(row*col));
end
for t=1:256
    m1=0.0;
    m2=0.0;
    P1=0.0;
    P2=0.0;
    for j=1:t
        P1=P1+ p(j);
        m1=m1+double(j*p(j));
    end
    for j=(t+1):256
        P2=P2+ p(j);
        m2=m2+double(j*p(j));
    end
    T(t)=P1*P2*((double(m1/P1)-double(m2/P2))^2);
end
max=0;
 for j=1:256
       if(max<T(j))
           t=j;
           max=T(j);
       end
 end
 for i=1:row
     for j=1:col
         if(I(i,j)<t)
            J(i,j)=0;
         else
            J(i,j)=255;
         end
     end
 end
 t
 imwrite(J,'otsu.pgm');
 figure(2) , imshow(J);
