clc;
clear all;
close all;
% 1

[X,map] = imread('windmill.bmp');
Y = zeros(256);
for i=1:length(Y) 
  Y(i) =(222*map(i,1)+707*map(i,2)+71*map(i,3))/1000;
end;
imwrite(Y,map,'palleta.bmp');
figure ;
imshow(X,map);

map2=zeros(256,3);
for i=1:length(map2)
    	map2(i,:)= Y(i);
end;

imwrite(X,map2,'palleta2.bmp');
figure;
imshow(X,map2);


% 2

HSI = zeros(256,3);
RGB = zeros(256,3);
% LAB31239689
k=5
S=((1-k)./10)
I=0.5;

% I=0.5

M=I*(1+S)
m=2*I-M

%Dimiourgia tou pinaka HSI
for i=1:256
    HSI(i,1) = i.*(360/256); %256 diaforetikes times gia to H (0<=H<=360)
    HSI(i,2) = 1; 
    HSI(i,3) = 0.5;    
end


%Metatropi apo HSI se RGB
for i=1:256


    % RED
    
    if (HSI(i,1)<=60)
        RGB(257-i,1) = m+(M-m)*(HSI(i,1)/60);
    end
    
    if (HSI(i,1)>60 & HSI(i,1)<=180)
        RGB(257-i,1) = M;
    end
    
    if (HSI(i,1)>180 & HSI(i,1)<=240)
        RGB(257-i,1) = m+(M-m)*((240-HSI(i,1))/60);
    end
    
    if (HSI(i,1)>240 & HSI(i,1)<=360)
        RGB(257-i,1) = m;
    end
    
    
   
    % GREEN
    
    if (HSI(i,1)<=120)
        RGB(257-i,2) = m;
    end
    
    if (HSI(i,1)>120 & HSI(i,1)<=180)
        RGB(257-i,2) = m+(M-m)*((HSI(i,1)-120)/60);
    end
    
    if (HSI(i,1)>180 & HSI(i,1)<=300)
        RGB(257-i,2) = M;
    end
    
    if (HSI(i,1)>300 & HSI(i,1)<=360)
        RGB(257-i,2) = m+(M-m)*((360-HSI(i,1))/60);
    end
    
    
   
    % BLUE
    
    if (HSI(i,1)<=60)
        RGB(257-i,3) = M;
    end
    
    if (HSI(i,1)>60 & HSI(i,1)<=120)
        RGB(257-i,3) = m+(M-m)*((120-HSI(i,1))/60);
    end
    
    if (HSI(i,1)>120 & HSI(i,1)<=240)
        RGB(257-i,3) = m;
    end    
    
    if (HSI(i,1)>240 & HSI(i,1)<=300)
        RGB(257-i,3) = m+(M-m)*((HSI(i,1)-240)/60);
    end
    
    if (HSI(i,1)>300 & HSI(i,1)<=360)
        RGB(257-i,3) = M;
    end
end

RGB_image = zeros(256,256);

for i = 1:256
    for j = 1:256
        RGB_image(i,j) = i;
    end
end

% Dhmiourgia ths eikonas
imwrite(RGB_image,RGB,'palleta3.bmp');
figure(3)
imshow('palleta3.bmp');

% 3

% cmap = rgb2hsv(RGB);
% S=0.1;
% 
% RGB = hsv2rgb(cmap);


for i = 0:5
[Xn,map3] = imread('windmill.bmp');
%figure;
%imshow(Xn,map3);
hsvImage = rgb2hsv(map3);
hsvImage(:,2) = hsvImage(:,2) * (1-(i*0.2));
map3 = hsv2rgb(hsvImage);

figure;
imwrite(Xn,map3,'palleta4.bmp');
imshow('palleta4.bmp');
end

% 4
n=451;
rgbimg= imread('Capture6.png');
siz=size(rgbimg);

rgbimg=imresize(rgbimg,[n n]);
figure;
imshow(rgbimg);
rgbimg=cast(rgbimg,'double');
R_avg=0;
G_avg=0;
B_avg=0;
rgbimgR=rgbimg;
rgbimgR(:,:,2:3)=0;
rgbimgG=rgbimg;
rgbimgG(:,:,1:2:3)=0;
rgbimgB=rgbimg;
rgbimgB(:,:,1:2)=0;
for x=1:n
    for y=1:n

        R_avg =  R_avg + rgbimg(x,y,1) ;
end
end
R_avg=R_avg/(n*n);

for x=1:n
    for y=1:n
         
        G_avg =  G_avg + rgbimg(x,y,2) ;
end
end
G_avg=G_avg/(n*n);

for x=1:n
    for y=1:n
       
        B_avg =  B_avg + rgbimg(x,y,3) ;
end
end
B_avg=B_avg/(n*n);

RnewR=rgbimgR.*(G_avg/R_avg);
RnewG=rgbimgG;
RnewB=rgbimgB.*(G_avg/B_avg);
Rnew=RnewR+RnewG+RnewB;
Rnew=cast(Rnew,'uint8');
figure;
imshow(Rnew);





