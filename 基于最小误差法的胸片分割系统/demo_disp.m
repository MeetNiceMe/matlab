clc; clear all; close all;
warning off all;
% 读取图像
filename = fullfile(pwd, 'images/test.jpg');
Img = imread(filename);
% 灰度化
if ndims(Img) == 3
    I = rgb2gray(Img);
else
    I = Img;
end
I2 = imadjust(I, [0.532 0.72], [0 1]);
figure;
subplot(2, 2, 1); imshow(I, []); title('原图像');
subplot(2, 2, 2); imshow(I2, []); title('增强图像');
subplot(2, 2, 3); imhist(I); title('原图像直方图');
subplot(2, 2, 4); imhist(I2); title('增强图像直方图');