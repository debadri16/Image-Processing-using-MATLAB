I = imread('lena_noisy.pgm');
[row,col] = size(I);
figure(1), imshow(I);
q=1;
for i=2:row-1
    for j=2:col-1
        sum1=0.0;
        sum=0.0;
        for x=(i-1):(i+1)
          for y=(j-1):(j+1)
              sum=sum +double(I(x,y))^(q+1);
              sum1=sum1+double(I(x,y))^q;
          end
        end
        CH_mean=double(sum)/double(sum1);
        J(i,j)=uint8(CH_mean);
    end
end
imwrite(J,'Lena_CH_mean.pgm');
figure(2), imshow('Lena_CH_mean.pgm');