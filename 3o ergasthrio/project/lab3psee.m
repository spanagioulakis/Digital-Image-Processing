clear all;
close all;
%% Askisi 1

[I,map] = imread('tools.bmp');
ft = abs(fftshift(fft2(I)));
figure();
colormap(map);
image(ft);
title('Fourier Transform');

c = 17;
D = c*log(1+ft);

figure();
colormap(map);
image(D);
title('Grayscale');

figure();
colormap(map);
colormap(jet)
image(D);
title('Different colours');

 %% Askisi 2

[Im,map1] = imread('Untitled.bmp');
[Im1,map2] = imread('Untitled3.bmp');


ftr = abs(fftshift(fft2(Im)));
ftr1 = abs(fftshift(fft2(Im1)));

figure();
subplot(2,1,1)
colormap(map1);
image(Im);
title('Picture');
subplot(2,1,2)
c = 17;
D1 = c*log(1+ftr);
colormap(map1);
image(D1);
title('Fourier Transform');

 
figure();
subplot(2,1,1)
colormap(map2);
image(Im1);
subplot(2,1,2)
D2 = c*log(1+ftr1);
colormap(map2);
image(D2);
title('Fourier Transform');

%% Askisi3

I2 = zeros(256,256);
I3 = zeros(256,256);

I2((256/2-5):(256/2+5),(256/2-5):(256/2+5))=255; %% τετράγωνο 10x10 στο κέντρο της εικόνας

I3((256/2-15):(256/2+15),(256/2-15):(256/2+15))=255; %% τετράγωνο 30x30 στο κέντρο της εικόνας

figure();
colormap(map);
image(I2);  %%a
title(' 10x10 in the center')

ft2 = abs(fftshift(fft2(I2)));

figure();
colormap(map);
subplot(2,1,1)
image(ft2);
title('without transformation');

D2 = c*log(1+ft2);

colormap(map);
subplot(2,1,2)
image(D2);
title(' 10x10 size With transformation');


figure();
colormap(map);
image(I3);  %%b
title(' 30x30 in the center')

ft3 = abs(fftshift(fft2(I3)));

figure();
colormap(map);
subplot(2,1,1)
image(ft3);
title('Without Transformation');

D3 = c*log(1+ft3);

colormap(map);
subplot(2,1,2)
image(D3);
title('30x30 size With Transformation');

%% Askisi 4

I2r = imrotate(I2,45);  %% περιστροφή παραθύρου εικόνας κατα 45 μοίρες

figure();
colormap(map);
image(I2r);  %%a
title('45 degrees')


ft2r = abs(fftshift(fft2(I2r)));

figure();
colormap(map);
subplot(2,1,1)
image(ft2r);
title('Without Transformation');

D2r = c*log(1+ft2r);

colormap(map);
subplot(2,1,2)
image(D2r);
title('10X10 rotated picture Without Transformation');

I3r = imrotate(I3,45);

figure();
colormap(map);
image(I3r);  %%b
title('Rotated by 45 degrees')


ft3r = abs(fftshift(fft2(I3r)));

figure();
colormap(map);
subplot(2,1,1)
image(ft3r);
title('Without Transformation');

D3r = c*log(1+ft3r);

colormap(map);
subplot(2,1,2)
image(D3r);
title('30x30 Rotated With Transformation');


%% Askisi 5

I2m = zeros(256,256);
I3m = zeros(256,256);

I2m((256/6-5):(256/6+5),(256/6-5):(256/6+5))=255; %% τετράγωνο 10x10 
I3m((256/6-15):(256/6+15),(256/6-15):(256/6+15))=255; %% τετράγωνο 30x30

figure();
colormap(map);
image(I2m);  %%a
title('Displaced  10x10 picture')

ft2m = abs(fftshift(fft2(I2m)));

figure();
colormap(map);
subplot(2,1,1)
image(ft2m);
title('Without Transformation');

D2m = c*log(1+ft2m);

colormap(map);
subplot(2,1,2)
image(D2m);
title('10x10 Displaced picture With Transformation');

figure();
colormap(map);
image(I3m);  %%b
title(' 30x30 Displaced Picture')

ft3m = abs(fftshift(fft2(I3m)));

figure();
colormap(map);
subplot(2,1,1)
image(ft3m);
title('With Transformation');

D3m = c*log(1+ft3m);

colormap(map);
subplot(2,1,2)
image(D3m);
title('30x30 Displaced Picture With Transformation');

%% Askisi 6

Ieq = histeq(I);

figure()
imshow(Ieq);
title('After  Histogram Equalization')

fteq = abs(fftshift(fft2(Ieq)));
Deq = c*log(1+fteq);

figure();
colormap(map);
image(Deq);
title('Spectrum After  Histogram Equalization');

