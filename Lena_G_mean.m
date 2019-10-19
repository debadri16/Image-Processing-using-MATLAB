I = imread('lena_noisy.pgm');
[row,col] = size(I);
figure(1), imshow(I);
for i=2:row-1
    for j=2:col-1
        mul=1;
        for x=(i-1):(i+1)
          for y=(j-1):(j+1)
              mul=mul*double(I(x,y));
          end
        end
        g_mean=mul^(1/9);
        J(i,j)=uint8(g_mean);
    end
end
figure(2), imshow(J);
imwrite(J,'Lena_G_mean.pgm');
imshow('Lena_G_mean.pgm');