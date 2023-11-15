% Lab2
clc;
clear;
close all;
%% Ex1
%%
%input_image = input('Enter the name of the image : ','s');
img_read = imread('bad2.bmp');
figure;
imshow(img_read)
title('Original Image.')
if(size(img_read,3)==1)   %%rgb
    H= rgb2gray(img_read);
else
    H=img_read(:,:,1);
end;
figure;
imhist(H)
title('Histogram of original.')

%%
newH=histeq(H);
figure;
imhist(newH)
title('New histogram.')
figure;
imshow(newH)
title('Image with new histogram.')

%%
thresholdedH=H;
[m,n]=size(H);
threshold=175;
for i=1:m
    for j=1:n
        if( thresholdedH(i,j)>threshold )    
            thresholdedH(i,j)=255;
        else
            thresholdedH(i,j)=0;
        end;
    end;
end;
figure;
imshow(thresholdedH);
title('Thesholded image.')
%% Ex2

%%
Img = imread('brain.gif');
figure
imshow(Img)
title('original "brain.gif"')

k1 = 5;         %%6+8+9=23, 2+3=5!
k2 = k1 + 2;    %%k1 odd--> k2=k1+2

A = medfilt2(Img,[k1 k1]);
figure
subplot(2,2,1)
imshow(A)
title('median filter 5x5')

B = medfilt2(Img,[k2 k2]);
subplot(2,2,2)
imshow(B)
title('median filter 7x7')

img1 = fspecial('gaussian', [k1 k1]);
img2 = fspecial('gaussian', [k2 k2]);

C = imfilter(Img,img1);
subplot(2,2,3)
imshow(C)
title('gaussian filter 5x5')

D = imfilter(Img,img2);
subplot(2,2,4)
imshow(D)
title('gaussian filter 7x7')

%% Ex3
SP_img = imnoise(Img,'salt & pepper');
figure;
imshow(SP_img)
title('"Brain.gif" with "salt & pepper".')
SP_img1 = medfilt2(SP_img,[k1 k1]);
figure

subplot(2,2,1)
imshow(SP_img1);
title('median filter 5x5')

SP_img2 = medfilt2(SP_img,[k2 k2]);
subplot(2,2,2)
imshow(SP_img2);
title('median filter 7x7')

img1 = fspecial('average', [k1 k1]);
img2 = fspecial('average', [k2 k2]);

SP_img3 = imfilter(SP_img,img1);
subplot(2,2,3)
imshow(SP_img3);
title('average filter 5x5')

SP_img4 = imfilter(SP_img,img2);
subplot(2,2,4)
imshow(SP_img4);
title('average filter 7x7')


%%Meso tetragwiko sfalma

[x,y] = size(SP_img);

se1 = sqrt(sum(sum((double(SP_img) - double(SP_img1)) .^ 2))) / (x * y)
se2 = sqrt(sum(sum((double(SP_img) - double(SP_img2)) .^ 2))) / (x * y)
se3 = sqrt(sum(sum((double(SP_img) - double(SP_img3)) .^ 2))) / (x * y)
se4 = sqrt(sum(sum((double(SP_img) - double(SP_img4)) .^ 2))) / (x * y)

%% Ex4


h = [1 1 1; 1 -8 1; 1 1 1];
Img1 = rgb2gray(imread('scene1.bmp'));
Img2 = rgb2gray(imread('scene2.bmp'));

A1 = medfilt2(Img1,[k1 k1]);
A2 = imfilter(Img1,h);

B1 = medfilt2(Img2,[k1 k1]);
B2 = imfilter(Img2,h);

figure;
subplot(1,2,1)
imshow(A1)
subplot(1,2,2)
imshow(B1)

figure;
imshow(B1-A1);
title('2 frames with median filter')

figure;
subplot(1,2,1)
imshow(A2)
subplot(1,2,2)
imshow(B2)

figure;
imshow(B2-A2);
title('2 frames with h filter')

