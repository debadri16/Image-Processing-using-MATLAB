A=imread('lena.pgm');
x=[1 0; 0 -1];
y=[0 1; -1 0];
[row, col]=size(A);
for i=1: row
    for j=1: col
        p=1;
        q=1;
        gx=0;
        gy=0;
        for m=i-1:i
            q=1;
            for n=j-1:j
                if m>0 && n>0 && m<=row && n<=col
                    gx=gx+double(A(m,n))*double(x(p,q));
                    gy=gy+double(A(m,n))*double(y(p,q));
                end
                q=q+1;
            end
            p=p+1;
        end
        g=sqrt(gx.^2 + gy.^2);
        g=uint8(g);
        B(i,j)=g;
    end
end
imshow(B);