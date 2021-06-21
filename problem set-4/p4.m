%% P4 Image Sampling
clc
clear
close all

% part 1
I=imread('tree.bmp');
% row and column size
row=size(I, 1);
column=size(I, 2);
imshow(I)
title('original image')
% resizing image by reducing number of pixels horizontally
s1=column/4;
part1= imresize(I, [row s1]);
figure;
imshow(part1)
title('resized image')

% part 2
s2=row/4;
part2= imresize(I, [s2 column]);
figure;
imshow(part2)
title('resized image')

% part 3
part3= imresize(I,0.5);
figure;
imshow(part3)
title('resized image')

% part 4
x=zeros(1,size(part3,2));
k=0;
part3=double(part3);

% adding rows and columns part3
% rows
for l=1:2*size(part3, 1)
    if mod(l,2)==0
    new_layer(l,:)=x;
    else
        new_layer(l,:)=part3(l-k,:,1);
        k=k+1;
    end
end
y=zeros(size(new_layer,1),1);
z=1;
% columns
for h=1:2*size(new_layer,2)
    if mod(h,2)==0
        final_layer(:,h)=new_layer(:,h-z,1);
        z=z+1;
    else
         final_layer(:,h)=y;  
    end
end
method1=final_layer;
method2=final_layer;
% first method
for i=1:size(method1,1)
    for j=1:size(method1,2)
        if mod(j,2)~=0 && mod(i,2)~=0
            method1(i,j)=method1(i,j+1);
        elseif mod(i,2)==0
            method1(i,j)=method1(i-1,j);
        end
    end
end
figure;
% PSNR, SNR, MSE
pic1=uint8(method1(1:471,1:895));
pic1=cat(3,pic1,pic1,pic1);
[peaksnr1, snr1] = psnr(pic1,I) %PSNR, SNR
error1 = I - (pic1);
MSE1 = sum(sum(error1 .* error1)) / (row * column) %MSE
imshow(pic1)
title('method 1')


% second method 
for i=1:size(method2,1)
    for j=1:size(method2,2)
        if j==1 && mod(i,2)~=0
            method2(i,j)=method2(i,j+1);
        elseif i==size(method2,1) && mod(j,2)==0
           method2(i,j)=method2(i-1,j);
        elseif j==1 && i==size(method2,1)
            method2(i,j)=method2(i-1,j);
        elseif j==1 && mod(i,2)==0 && i< size(method2,1)
            method2(i,j)=(method2(i-1,j+1)+method2(i+1,j+1))/2;
        elseif mod(i,2)==0 && j>1 && mod(j,2)~=0
            method2(i,j)=(method2(i-1,j+1)+method2(i-1,j-1))/2;
        elseif  mod(i,2)~=0 && j>1 && mod(j,2)~=0 && i<size(method2,1)
            method2(i,j)=(method2(i,j+1)+method2(i,j-1))/2;

        end
    end
end
% PSNR, SNR, MSE
pic2=uint8(method2(1:471,1:895));
pic2=cat(3,pic2,pic2,pic2);
[peaksnr2, snr2] = psnr(pic2,I) %PSNR
error2 = I - (pic2);
MSE2 = sum(sum(error2 .* error2)) / (row * column) %MSE
figure;
imshow(pic2)
title('method 2')