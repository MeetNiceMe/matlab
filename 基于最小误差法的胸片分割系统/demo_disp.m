clc; clear all; close all;
warning off all;
% ��ȡͼ��
filename = fullfile(pwd, 'images/test.jpg');
Img = imread(filename);
% �ҶȻ�
if ndims(Img) == 3
    I = rgb2gray(Img);
else
    I = Img;
end
I2 = imadjust(I, [0.532 0.72], [0 1]);
figure;
subplot(2, 2, 1); imshow(I, []); title('ԭͼ��');
subplot(2, 2, 2); imshow(I2, []); title('��ǿͼ��');
subplot(2, 2, 3); imhist(I); title('ԭͼ��ֱ��ͼ');
subplot(2, 2, 4); imhist(I2); title('��ǿͼ��ֱ��ͼ');