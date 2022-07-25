clc; clear all; close all;
I = imread(fullfile(pwd, 'images/test.jpg'));
X = imadjust(I, [0.2 0.8], [0 1]);
% ��ֵ�ָ�
bw = im2bw(X, graythresh(X));
[r, c] = find(bw);
rect = [min(c) min(r) max(c)-min(c) max(r)-min(r)];
Xt = imcrop(X, rect);
% �Զ���ȡ���ӵ�
seed_point = round([size(Xt, 2)*0.15+rect(2) size(Xt, 1)*0.4+rect(1)]);
% ���������ָ�
X = im2double(im2uint8(mat2gray(X)));
X(1:rect(2), :) = 0;
X(:, 1:rect(1)) = 0;
X(rect(2)+rect(4):end, :) = 0;
X(:, rect(1)+rect(3):end) = 0;
[J, seed_point, ts] = Regiongrowing(X, seed_point);
figure(1);
subplot(1, 2, 1); imshow(I, []);
hold on;
plot(seed_point(1), seed_point(2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
title('���ӵ��Զ�ѡ��');
hold off;
subplot(1, 2, 2); imshow(J, []); title('��������ͼ��');
% ��̬ѧ����
bw = imfill(J, 'holes');
bw = imopen(bw, strel('disk', 5));
% ��ȡ��Ե
ed = bwboundaries(bw);
figure;
subplot(1, 2, 1); imshow(bw, []); title('��̬ѧ����ͼ��');
subplot(1, 2, 2); imshow(I); 
hold on;
for k = 1 : length(ed)
    % ��Ե
    boundary = ed{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2);
end
hold off;
title('��Ե���ͼ��');