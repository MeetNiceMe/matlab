clc; clear all; close all;
Img = imread(fullfile(pwd, 'images', 'test.png'));
I = rgb2gray(Img);
figure; 
subplot(1, 2, 1); imshow(Img, []); title('ԭͼ��');
subplot(1, 2, 2); imshow(I, []); title('�Ҷ�ͼ��');