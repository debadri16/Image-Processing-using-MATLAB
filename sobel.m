A=imread('lena.pgm');
x=[-1 0 1; -2 0 2; -1 0 1];
y=[-1 -2 -1; 0 0 0; 1 2 1];
gx=conv2(double(A),double(x), 'same');
gy=conv2(double(A),double(y), 'same');
g=sqrt(gx.^2 + gy.^2);
g=uint8(g);
imshow(g);