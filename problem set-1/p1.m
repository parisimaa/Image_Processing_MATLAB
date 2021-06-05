%% P1, part 1
clc
clear 
close all
x=imread('img1.tif');
x=~x;
imshow(x)
%% P1, part 2
clc
clear
close all
x=imread('img1.tif');
y=imread('img2.tif');
result=x & y;
imshow(result)
%% P1, part 3
clc
clear 
close all
x=imread('img1.tif');
y=imread('img2.tif');
result=imadd(x,y);
imshow(result)
%% P1, part 4
clc
clear
close all
x=imread('img1.tif');
y=imread('img2.tif');
comb=imfuse(x,y,'diff');
imshow(comb)
%% P1, part 5
clc
clear
close all
x=imread('img1.tif');
y=imread('img2.tif');
result=x & ~y;
imshow(result)
%% P1, part 6
clc
clear 
close all
x=imread('img1.tif');
y=imread('img2.tif');
result=imadd(x,~y);
imshow(result)