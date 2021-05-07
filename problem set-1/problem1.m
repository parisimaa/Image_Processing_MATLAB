% Image Processing problem set-1
% Parisima Abdali 
%% Q2, part 1
clc
clear 
close all
x=imread('img1.tif');
x=~x;
imshow(x)
%% Q2, part 2
clc
clear
close all
x=imread('img1.tif');
y=imread('img2.tif');
result=x & y;
imshow(result)
%% Q2, part 3
clc
clear 
close all
x=imread('img1.tif');
y=imread('img2.tif');
result=imadd(x,y);
imshow(result)
%% Q2, part 4
clc
clear
close all
x=imread('img1.tif');
y=imread('img2.tif');
comb=imfuse(x,y,'diff');
imshow(comb)
%% Q2, part 5
clc
clear
close all
x=imread('img1.tif');
y=imread('img2.tif');
result=x & ~y;
imshow(result)
%% Q2, part 6
clc
clear 
close all
x=imread('img1.tif');
y=imread('img2.tif');
result=imadd(x,~y);
imshow(result)
%% Q3, part 1
% image negative
clc
clear
close all
im=imread('img3.tif');
% function (scaled to 255 intensity)
t=255-im;
% display
subplot(1,2,1)
imshow(im)
title('original image')
subplot(1,2,2)
imshow(t)
title('transferred image')
%% Q3, part 2
clc
clear
close all
r=double(imread('img3.tif'));
[m,n]=size(r);
% r,s axis (scaled to 255 intensity) 
r1=51; 
r2=140.25;
s1=51;
s2=140.25;
a=s1/r1;
b=0;
c=(255-s2)/(255-r2);
% function (three conditions)

for i=1:m
    for j=1:n
         if r(i,j)<r1
             s(i,j)=a*r(i,j);
         elseif r(i,j)<r2 
             s(i,j)=b*(r(i,j)-r1)+s1;
         else
             s(i,j)=c*(r(i,j)-r2)+s2;
         end
    end
end

% display
subplot(1,2,1)
imshow(uint8(r))
title('original image')
subplot(1,2,2)
imshow(uint8(s))
title('transferred image')
%% Q3, part 3
clc
clear
close all
r=double(imread('img3.tif'));
[m,n]=size(r);
% r,s axis (scaled to 255 intensity) 
r1=102; 
r2=140.25;
s1=102;
s2=140.25;
a=0;
b=(s2-s1)/(r2-r1);
c=0;
% function (three conditions)

for i=1:m
    for j=1:n
         if r(i,j)<r1
             s(i,j)=a*r(i,j);
         elseif r(i,j)<r2 
             s(i,j)=b*(r(i,j)-r1)+s1;
         else
             s(i,j)=c*(r(i,j)-r2)+s2;
         end
    end
end

% display
subplot(1,2,1)
imshow(uint8(r))
title('original image')
subplot(1,2,2)
imshow(uint8(s))
title('transferred image')
%% Q3, part 4
clc
clear
close all
r=double(imread('img3.tif'));
[m,n]=size(r);
% r,s axis (scaled to 255 intensity) 
r1=51; 
r2=140.25;
s1=76.5;
a=s1/r1;
b=0;
c=(255-s1)/(255-r2);
% function (three conditions)

for i=1:m
    for j=1:n
         if r(i,j)<r1
             s(i,j)=a*r(i,j);
         elseif r(i,j)<r2 
             s(i,j)=b*(r(i,j)-r1)+s1;
         else
             s(i,j)=c*(r(i,j)-r2)+s1;
         end
    end
end

% display
subplot(1,2,1)
imshow(uint8(r))
title('original image')
subplot(1,2,2)
imshow(uint8(s))
title('transferred image')
%% Q3, part 5
clc
clear
close all
r=double(imread('img3.tif'));
[m,n]=size(r);
% function (three conditions)

for i=1:m
    for j=1:n
         s(i,j)=r(i,j)^0.5;
         end
end

% display
subplot(1,2,1)
imshow(uint8(r))
title('original image')
subplot(1,2,2)
imshow(uint8(s))
title('transferred image')
%% Q3, part 6
clc
clear
close all
r=double(imread('6.jpg'));
[m,n]=size(r);
% function (three conditions)

for i=1:m
    for j=1:n
         s(i,j)=0.5*r(i,j);
         end
end

% display
subplot(1,2,1)
imshow(uint8(r))
title('original image')
subplot(1,2,2)
imshow(uint8(s))
title('transferred image')