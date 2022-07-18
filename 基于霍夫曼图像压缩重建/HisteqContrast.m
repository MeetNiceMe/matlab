function HisteqContrast(Img1, Img2)
figure('Name', 'ֱ��ͼ�Ա�', 'NumberTitle', 'Off', ...
    'Units', 'Normalized', 'Position', [0.1 0.1 0.5 0.5]);
subplot(2, 2, 1); imshow(mat2gray(Img1)); title('ԭͼ��', 'FontWeight', 'Bold');
subplot(2, 2, 2); imshow(mat2gray(Img2)); title('������ͼ��', 'FontWeight', 'Bold');
if ndims(Img1) == 3
    Q = rgb2gray(Img1);
else
    Q = mat2gray(Img1);
end

if ndims(Img2) == 3
    W = rgb2gray(Img2);
else
    W = mat2gray(Img2);
end

subplot(2, 2, 3); imhist(Q, 64); title('ԭ�Ҷ�ֱ��ͼ', 'FontWeight', 'Bold');
subplot(2, 2, 4); imhist(W, 64); title('�����ĻҶ�ֱ��ͼ', 'FontWeight', 'Bold');
