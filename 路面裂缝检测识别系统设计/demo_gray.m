clc; clear all; close all;
I = imread('./images/test.png');
g = rgb2gray(I);
figure;
subplot(1, 2, 1); imshow(I, []); title('ԭͼ��');
subplot(1, 2, 2); imshow(g, []); title('�Ҷ�ͼ��');