%% P6, discrete fourier transform
clc
clear
close all

% part 1
img1=imread('owl.jpg');
img2=imread('man.jpg');
% 2-D fourier transform
img1_fft=fft2(double(img1)); %owl
img2_fft=fft2(double(img2)); %man
% shift (for getting centered spectrum)
owl=fftshift(img1_fft);
man=fftshift(img2_fft);
figure;
subplot(2,2,1)
imshow(img1_fft)
title('fft2 transform owl')
subplot(2,2,2)
imshow(img2_fft)
title('fft2 transform man')
subplot(2,2,3)
imshow(owl)
title('fftshift owl')
subplot(2,2,4)
imshow(man)
title('fftshift man')
% phase man
figure;
theta_man = angle(man);
subplot(1,2,1)
imshow(theta_man)
title('phase fourier transform man')
% abs man
abs_man=log(1+abs(man));
subplot(1,2,2)
imshow(abs_man,[])
title('magnitude fourier transform man')

% part 2
% cilcular shift
cf_man=circshift(img2,1);
figure;
subplot(3,3,1)
imshow(cf_man)
title('circular shift man')
fft1=fft2(cf_man);
ffsh1=fftshift(fft1);
p1=angle(ffsh1);
a1=log(1+abs(ffsh1));
subplot(3,3,2)
imshow(p1)
title('phase circular shift')
subplot(3,3,3)
imshow(a1,[])
title('magnitude circular shift')
% 90 degree rotation
r_man=imrotate(img2,-90);
subplot(3,3,4)
imshow(r_man)
title('90 degree clock wise rotation man')
fft2=fft2(r_man);
ffsh2=fftshift(fft2);
p2=angle(ffsh2);
a2=log(1+abs(ffsh2));
subplot(3,3,5)
imshow(p2)
title('phase 90 degree rotation')
subplot(3,3,6)
imshow(a2,[])
title('magnitude 90 degree rotation')
% scaling
s_man=imresize(img2,2);
subplot(3,3,7)
imshow(s_man)
title('doubling man image in every dimention')
fft3=fft2(s_man);
ffsh3=fftshift(fft3);
p3=angle(ffsh3);
a3=log(1+abs(ffsh3));
subplot(3,3,8)
imshow(p3)
title('phase scaling')
subplot(3,3,9)
imshow(a3,[])
title('magnitude scaling')

% part 3
abs_man = abs(img2_fft);
phase_man = angle(img2_fft);

% phase shifting
n1_phase_man=phase_man+pi/4;
% reconstructin man
mr1_man =abs_man;
pr1_man = n1_phase_man;
% display
figure;
subplot(2,3,1)
man_1_recon =ifft2( mr1_man .* exp(j * pr1_man ));
imshow(uint8(abs(man_1_recon)))
title('reconstructed man (shifting)')

% phase rotation 
n2_phase_man=imrotate(phase_man,-90);
% reconstructin man
mr2_man =abs_man;
pr2_man = n2_phase_man;
% display
subplot(2,3,2)
man_2_recon =ifft2( mr2_man * exp(j * pr2_man ));
imshow(uint8(abs(man_2_recon)))
title('reconstructed man (90 degree rotation)')

% zero phase
n3_phase_man=0;
% reconstructin man
mr3_man =abs_man;
pr3_man = n3_phase_man;
% display
subplot(2,3,3)
man_3_recon =ifft2( mr3_man * exp(j * pr3_man ));
imshow(uint8(abs(man_3_recon)))
title('reconstructed man (zero phase)')

% magnitude shift
n4_magt_man=abs_man+40000;
% reconstructin man
mr4_man =n4_magt_man;
pr4_man = phase_man;
% display
subplot(2,3,4)
man_4_recon =ifft2( mr4_man .* exp(j * pr4_man ));
imshow(uint8(abs(man_4_recon)))
title('reconstructed man (magnitude shift)')

% magnitude rotation
n5_magt_man=imrotate(abs_man,-90);
% reconstructin man
mr5_man =n5_magt_man;
pr5_man = phase_man;
% display
subplot(2,3,5)
man_5_recon =ifft2( mr5_man * exp(j * pr5_man ));
imshow(uint8(abs(man_5_recon)))
title('reconstructed man (magnitude rotation)')

% half real magnitude
n6_magt_man=abs_man/2;
% reconstructin man
mr6_man =n6_magt_man;
pr6_man = phase_man;
% display
subplot(2,3,6)
man_6_recon =ifft2( mr6_man .* exp(j * pr6_man ));
imshow(uint8(abs(man_6_recon)))
title('reconstructed man (half magnitude)')