%% P3, Image Quantization
clc
clear
close all

% part 1
color_car=imread('car.jpg');
% color image array
y=color_car(1:717,1:1366);
gray_car=rgb2gray(color_car);
subplot(2,1,1)
imshow(color_car)
title('color car')
subplot(2,1,2)
imshow(gray_car)
title('gray car')

% part 2
% extract color channels.
redChannel = color_car(:,:,1); % Red channel
greenChannel = color_car(:,:,2); % Green channel
blueChannel = color_car(:,:,3); % Blue channel
% red channel max,min,mean,var
maxValue_red = max(redChannel(:));
minValue_red = min(redChannel(:));
meanValue_red = mean2(redChannel);
varValue_red = var(double(redChannel(:)));
% green channel max,min,mean,var
maxValue_green = max(greenChannel(:));
minValue_green = min(greenChannel(:));
meanValue_green = mean2(greenChannel);
varValue_green = var(double(greenChannel(:)));
% blue channel max,min,mean,var
maxValue_blue = max(blueChannel(:));
minValue_blue = min(blueChannel(:));
meanValue_blue = mean2(blueChannel);
varValue_blue = var(double(blueChannel(:)));
% gray image array
x=gray_car(1:717,1:1366);
% maximum luminance
maxValue = max(x(:));
% minimum luminance
minValue = min(x(:));
% mean luminance values of image
meanValue = mean2(x);
% variance luminance values of image
varValue = var(double(x(:)));


% part 3
% make black two channels in each set
black = zeros(size(color_car, 1), size(color_car, 2), 'uint8');
% show only the desired color channle
just_red = cat(3, redChannel,black,black);
just_green = cat(3,black, greenChannel,black);
just_blue = cat(3,black,black, blueChannel);
% display
figure;
subplot(3,1,1)
imshow(just_red)
title('just red channel')
subplot(3,1,2)
imshow(just_green)
title('just green channel')
subplot(3,1,3)
imshow(just_blue)
title('just blue channel')

% part 4
% inversed color channels 
just_red_inv = cat(3,255- redChannel,black,black);
just_green_inv = cat(3,black,255- greenChannel,black);
just_blue_inv = cat(3,black,black,255- blueChannel);
figure;
subplot(3,1,1)
imshow(just_red_inv)
title('just red channel')
subplot(3,1,2)
imshow(just_green_inv)
title('just green channel')
subplot(3,1,3)
imshow(just_blue_inv)
title('just blue channel')

% part 5
% extracting two channels in each set
green_red = cat(3, redChannel,greenChannel,black);
blue_green = cat(3,black, greenChannel,blueChannel);
red_blue = cat(3,redChannel,black, blueChannel);
% display
figure;
subplot(3,1,1)
imshow(green_red)
title('green & red channel')
subplot(3,1,2)
imshow(blue_green)
title('blue & green channel')
subplot(3,1,3)
imshow(red_blue)
title('red & blue channel')

% part 6
R = color_car(:,:,1);
G = color_car(:,:,2);
B = color_car(:,:,3);
% red (3bits)
r1=bitget(R,6);
r2=bitget(R,7);
r3=bitget(R,8);
% green (4 bits)
g1=bitget(G,5);
g2=bitget(G,6);
g3=bitget(G,7);
g4=bitget(G,8);
% blue (2 bits)
b1=bitget(B,5);
b2=bitget(B,6);
new_red=bitset(bitset(r3,1,r2),2,r1);
new_green=bitset(bitset(bitset(g4,1,g3),2,g2),3,g1);
new_blue=bitset(b2,1,b1);
new_image=cat(3,new_red,new_green,new_blue);
figure;
imshow(color_car)
figure
imshow(double(new_image))

% part 7
XYZ = rgb2xyz(color_car);
figure;
imshowpair(color_car,XYZ,'montage')

% part 8
XYZ1=uint8(XYZ);
R = XYZ1(:,:,1);
G = XYZ1(:,:,2);
B = XYZ1(:,:,3);
% red (3bits)
r1=bitget(R,6);
r2=bitget(R,7);
r3=bitget(R,8);
% green (4 bits)
g1=bitget(G,5);
g2=bitget(G,6);
g3=bitget(G,7);
g4=bitget(G,8);
% blue (2 bits)
b1=bitget(B,5);
b2=bitget(B,6);
new_red=bitset(bitset(r3,1,r2),2,r1);
new_green=bitset(bitset(bitset(g4,1,g3),2,g2),3,g1);
new_blue=bitset(b2,1,b1);
new_image=cat(3,new_red,new_green,new_blue);
figure;
imshow(XYZ)
figure
imshow(new_image)
