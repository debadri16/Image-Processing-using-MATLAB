I = imread('lena_noisy.pgm');
[row,col] = size(I);
figure(1), imshow(I);
for i=2:row-1
    for j=2:col-1
        sum=0.0;
        for x=(i-1):(i+1)
          for y=(j-1):(j+1)
              sum=sum +(1.0/double(I(x,y)));
          end
        end
        H_mean=9.0/double(sum);
        J(i,j)=uint8(H_mean);
    end
end
imwrite(J,'Lena_H_mean.pgm');
figure(2), imshow('Lena_H_mean.pgm');