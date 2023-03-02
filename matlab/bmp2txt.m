clc;clear `all;close all;

IMAGE_WIDTH = 752;
IMAGE_HIGHT = 480;

%load origin image
I = imread('pic.bmp');  
%I = rgb2gray(I);

%% output image data in hex file
raw_image = reshape(I, IMAGE_HIGHT, IMAGE_WIDTH);
raw_image = raw_image';
fid2 = fopen('image_from_matlab.txt', 'wt');

fprintf(fid2, '%02x\n', raw_image);
fid2 = fclose(fid2);

%show origin image
figure,imshow(I);
title('Original image'); 












