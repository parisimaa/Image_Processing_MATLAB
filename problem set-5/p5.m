%% P5 Image Information
clc
clear
close all

% part 1
img1=imread('baboon.bmp');
img2=imread('flower.bmp');
% picture baboon
figure;
[c1,x1]=imhist(img1);
stem(x1,c1);
title('histogram image baboon')
x1=transpose(x1);
M1=size(img1,1);
N1=size(img1,2);
n1= M1*N1; %total number of pixels
p1=x1/n1;  % probability

for i=1:size(p1)
    if p1(i)==0
        p1(i)=[];
    end
end
entropy1= -sum(p1 .*log(p1)); %entropy 

% picture flower
figure;
[c2,x2]=imhist(img2(:,:,1));
stem(x2,c2);
title('histogram image flower')
x2=transpose(x2);
M2=size(img2,1);
N2=size(img2,2);
n2= M2*N2; %total number of pixels
p2=x2/n2;  % probability

for i=1:size(p2)
    if p2(i)==0
        p2(i)=[];
    end
end
entropy2= -sum(p2 .*log(p2)); %entropy 

% part 2
% maximum entropy will occure when all probabilities have same value

% part 3