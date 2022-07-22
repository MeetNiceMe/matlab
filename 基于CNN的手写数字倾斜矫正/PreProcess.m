% ��ȡͼ��
clc; clear all; close all;
% ����ͼ��
[FileName,PathName,FilterIndex] = uigetfile(...
    {'*.jpg;*.tif;*.png;*.gif', ...
    '����ͼ���ļ�';...
    '*.*','�����ļ�' },'��������ͼ��',...
    '.\\images\\��д����\\t0.jpg');
if isequal(FileName, 0) || isequal(PathName, 0)    
    return;    
end
fileName = fullfile(PathName, FileName);
% ��ȡͼ��
Img = imread(fileName);
% ͼ��Ԥ����
if ndims(Img) == 3    
    I = rgb2gray(Img);    
else    
    I = Img;    
end
% �����������С��һ��Ϊ24��24����
I1 = imresize(I, [24 24], 'bicubic');
% ��ֵ�˲�
I2 = medfilt2(I1, 'symmetric');
% ��ֵ��
bw = im2bw(I2, graythresh(I2));
% ��ɫ
bw = ~bw;
% ��ʾ������
figure('Name', 'ͼ��Ԥ����', 'NumberTitle', 'Off', ...
    'Units', 'Normalized', 'Position', [0.2 0.2 0.7 0.5]);
subplot(2, 2, 1); imshow(Img, []); title('ԭͼ��');
subplot(2, 2, 2); imshow(I1, []); title('�Ҷ�ͼ��');
subplot(2, 2, 3); imshow(I2, []); title('�˲�ͼ��');
subplot(2, 2, 4); imshow(bw, []); title('��ֵ��ͼ��');
