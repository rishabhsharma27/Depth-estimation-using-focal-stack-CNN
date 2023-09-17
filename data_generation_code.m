count = 82;
xyz = im2single(imread(['F:\image classification\NN_input\1\1.png' ]));
h = 510;
w = 510;
depth_map = imread('depth.png');
depth_map = depth_map(1:510,1:510);
%octagonal window size
w_size= 5;
w_width1= 1;
w_vary= 1;  %when the w_size1 changes to maintain the size w_size1 the adjust is made
a=floor(h/w_size);     %height of image divide by window size
b=floor(w/w_size);     %width of image divide by window size
c= a*b;   %number of windows i.e a*b
for i = 3:21
    xyz = 0;
    cd(['F:\image classification\NN_input\' num2str(i)])
    for j =1:81
        Shift{j} = im2single(imread(['F:\image classification\NN_input\' num2str(i) '\' num2str(j) '.png' ]));
    end
        [Shift1,grad_Shift] = grad_add(Shift,count);
    for j =1:81
        Shift1{j} = Shift1{j}(8:517,8:517,:);
        xyz = xyz + Shift1{j};
    end
    xyz = xyz/81;
    figure,imshow(xyz)
    count2=1;
    for m=1:a
        for n=1:b
            imgfocus{count2} = (xyz((m-1)*w_size+1:(m-1)*w_size+w_size,(n-1)*w_size+1:(n-1)*w_size+w_size ,: ));
            depthimg{count2} = (depth_map((m-1)*w_size+1:(m-1)*w_size+w_size,(n-1)*w_size+1:(n-1)*w_size+w_size));
        for k=1:81
            img1{count2,k} = (Shift1{k}((m-1)*w_size+1:(m-1)*w_size+w_size,(n-1)*w_size+1:(n-1)*w_size+w_size ,: ));
        end
        count2=count2+1;
        end
    end

    for j = 1:10404
        for k = 1:82
            if k ==82
                    lf(1:5,(k-1)*5 + 1: (k-1)*5 + 5 ,:) = imgfocus{1,k};
                else
                    lf(1:5,(k-1)*5 + 1: (k-1)*5 + 5 ,:) = img1{j,k};
            end
        end
        location = (['F:\image classification\NN_input\input\' num2str(i) '_' num2str(j) '.png']);
        imwrite(lf, location);
    end
    
    for j = 1:10404
        depth_lf = depthimg{j};
        location = (['F:\image classification\NN_input\output\' num2str(i) '_' num2str(j) '.png']);
        imwrite(depth_lf, location);
    end
end