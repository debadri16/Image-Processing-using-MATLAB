function img = histogram_eq(imgName)
    A=imread(imgName);
    [row, col] = size(A);
    count_arr = zeros(256,1);
    for i=1:row
        for j=1:col
            count_arr(A(i,j)+1) = count_arr(A(i,j)+1)+1;
        end
    end

    for i=2:256
        count_arr(i)=count_arr(i)+count_arr(i-1);
    end

    for i=1:row
        for j=1:col
            B(i,j)=uint8(255*double(count_arr(A(i,j)+1))/(row*col));
        end
    end
    img=B;
end


