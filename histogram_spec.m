function histogram_spec()
    p1=histogram_eq('lena.pgm');
    p2=histogram_eq('original_zelda.pgm');
    A=imread('lena.pgm');
    [row, col]=size(A);
    for i=1:256
        for j=1:256
            if p2(j)==p1(i)
                t(i)=j;
                break
            elseif p2(j)>p1(i)
                t(i)=j-1;
                break
            end
        end
    end
    
    for i=1:row
        for j=1:col
            B(i,j)=uint8(t(A(i,j)+1));
        end
    end
    imshow(B);
end

function ret = histogram_eq(imgName)
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
    for i=1:256
        p(i)=uint8(255*double(count_arr(i))/(row*col));
    end
    ret=p;
end

