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
% ֱ�Ӷ�ֵ��
bw_direct = im2bw(I);
figure; imshow(bw_direct); title('ֱ�Ӷ�ֵ���ָ�');
% Ȧѡθ�������
c = [1524 1390 1454 1548 1652 1738 1725 1673 1524];
r = [1756 1909 2037 2055 1997 1863 1824 1787 1756];
bw_poly = roipoly(bw_direct, c, r);
figure;
imshow(I, []);
hold on;
plot(c, r, 'r-', 'LineWidth', 2);
hold off;
title('��������ѡ��');
% ����θ�ڿ���Ϊ255
J = I;
J(bw_poly) = 255;
% ͼ����ǿ
J = mat2gray(J);
J = imadjust(J, [0.532 0.72], [0 1]);
J = im2uint8(mat2gray(J));
figure; imshow(J, []); title('ͼ����ǿ����');
% ֱ��ͼͳ��
[counts, gray_style] = imhist(J);
% ���ȼ���
gray_level = length(gray_style);
% ������Ҷȸ���
gray_probability  = counts ./ sum(counts);
% ͳ�����ؾ�ֵ
gray_mean = gray_style' * gray_probability;
% ��ʼ��
gray_vector = zeros(gray_level, 1);
w = gray_probability(1);
mean_k = 0;
gray_vector(1) = realmax;
ks = gray_level-1;
for k = 1 : ks
    % ��������
    w = w + gray_probability(k+1);
    mean_k = mean_k + k * gray_probability(k+1);
    % �ж��Ƿ�����
    if (w < eps) || (w > 1-eps)
        gray_vector(k+1) = realmax;
    else
        % �����ֵ
        mean_k1 = mean_k / w;
        mean_k2 = (gray_mean-mean_k) / (1-w);
        % ���㷽��
        var_k1 = (((0 : k)'-mean_k1).^2)' * gray_probability(1 : k+1);
        var_k1 = var_k1 / w;
        var_k2 = (((k+1 : ks)'-mean_k2).^2)' * gray_probability(k+2 : ks+1);
        var_k2 = var_k2 / (1-w);
        % ����Ŀ�꺯��
        if var_k1 > eps && var_k2 > eps
            gray_vector(k+1) = 1+w * log(var_k1)+(1-w) * log(var_k2)-2*w*log(w)-2*(1-w)*log(1-w);
        else
            gray_vector(k+1) = realmax;
        end
    end
end
% ��ֵͳ��
min_gray_index = find(gray_vector == min(gray_vector));
min_gray_index = mean(min_gray_index);
% ������ֵ
threshold_kittler = (min_gray_index-1)/ks;
% ��ֵ�ָ�
bw__kittler = im2bw(J, threshold_kittler);
% ��ʾ
figure; imshow(bw__kittler, []); title('��С���ָ�');
% ��̬ѧ����
bw_temp = bw__kittler;
% ��ɫ
bw_temp = ~bw_temp;
% ���׶�
bw_temp = imfill(bw_temp, 'holes');
% ȥ��
bw_temp = imclose(bw_temp, strel('disk', 5));
bw_temp = imclearborder(bw_temp);
% ������
[L, num] = bwlabel(bw_temp);
% ��������
stats = regionprops(L);
Ar = cat(1, stats.Area);
% ��ȡĿ�겢����
[Ar, ind] = sort(Ar, 'descend');
bw_temp(L ~= ind(1) & L ~= ind(2)) = 0;
% ȥ��
bw_temp = imclose(bw_temp, strel('disk',20));
bw_temp = imfill(bw_temp, 'holes');
figure;
subplot(1, 2, 1); imshow(bw__kittler, []); title('�������ֵͼ��');
subplot(1, 2, 2); imshow(bw_temp, []); title('��̬ѧ����ͼ��');
% ��ȡ�α�Ե
ed = bwboundaries(bw_temp);
% ��ʾ
figure;
subplot(2, 2, 1); imshow(I, []); title('ԭͼ��');
subplot(2, 2, 2); imshow(J, []); title('��ǿͼ��');
subplot(2, 2, 3); imshow(bw_temp, []); title('��ֵ��ͼ��');
subplot(2, 2, 4); imshow(I, []); hold on;
for k = 1 : length(ed)
    % ��Ե
    boundary = ed{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2);
end
title('�α�Ե��ʾ���');
figure;
subplot(1, 2, 1); imshow(bw_temp, []); title('��ֵͼ��');
subplot(1, 2, 2); imshow(I, []); hold on;
for k = 1 : length(ed)
    % ��Ե
    boundary = ed{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2);
end
title('�α�Ե��ʾ���');
