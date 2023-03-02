clc;clear `all;close all;

IMAGE_WIDTH = 640;
IMAGE_HIGHT = 480;

%load fft fiter image data from txt
fid1 = fopen('rfile.txt', 'r');
img = fscanf(fid1,'%x');
fclose(fid1);
img2 = reshape(img,IMAGE_WIDTH,IMAGE_HIGHT);
img2 = img2';

%load origin image
I = imread('pic.bmp');  
%I = rgb2gray(I);

%show origin image
figure,imshow(I);
title('Original image 752X480'); 

%show fft fiter image with FPGA
figure,imshow(img2,[])    		
title('Image with FPGA 640X480');
