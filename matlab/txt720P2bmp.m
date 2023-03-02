clc;clear `all;close all;

IMAGE_WIDTH = 1280;
IMAGE_HIGHT = 720;

%load fft fiter image data from txt
fid1 = fopen('rfile.txt', 'r');
img = fscanf(fid1,'%x');
fclose(fid1);

img = uint8(img);
img2 = reshape(img,3,IMAGE_WIDTH,IMAGE_HIGHT);
img3 = permute(img2,[3,2,1]);

imshow(img3);
title('Image from FPGA design');
