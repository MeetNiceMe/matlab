function [J, seed_point, ts] = Regiongrowing(I, seed_point)
% ͳ�ƺ�ʱ
t1 = cputime;
% �������
if nargin < 2
    % ��ʾ��ѡ�����ӵ�
    figure; imshow(I,[]);  hold on;
    seed_point = ginput(1);   
    plot(seed_point(1), seed_point(2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    title('���ӵ�ѡ��');
    hold off;
end
% ������ʼ��
seed_point = round(seed_point);
x = seed_point(2);
y = seed_point(1);
I = double(I);
rc = size(I);
J = zeros(rc(1), rc(2));
% ������ʼ��
seed_pixel = I(x,y);
seed_count = 1;
pixel_free = rc(1)*rc(2); 
pixel_index = 0;
pixel_list = zeros(pixel_free, 3);
pixel_similarity_min = 0;
pixel_similarity_limit = 0.1;
% ����
neighbor_index = [-1 0;
        1 0;
        0 -1;
        0 1];
% ѭ������
while pixel_similarity_min < pixel_similarity_limit && seed_count < rc(1)*rc(2)   
    % ���������
    for k = 1 : size(neighbor_index, 1)
        % ��������λ��
        xk = x + neighbor_index(k, 1); 
        yk = y + neighbor_index(k, 2);
        % ��������
        if xk>=1 && yk>=1 && xk<=rc(1) && yk<=rc(2) && J(xk,yk) == 0
            % ��������
            pixel_index = pixel_index+1;
            pixel_list(pixel_index,:) = [xk yk I(xk,yk)]; 
            % ����״̬
            J(xk, yk) = 1;
        end
    end
    % ���¿ռ�
    if pixel_index+10 > pixel_free 
        pixel_free = pixel_free+pixel_free;
        pixel_list(pixel_index+1:pixel_free,:) = 0;
    end
    % ͳ�Ƶ���
    pixel_similarity = abs(pixel_list(1:pixel_index,3) - seed_pixel);
    [pixel_similarity_min, index] = min(pixel_similarity);
    % ����״̬
    J(x,y) = 1; 
    seed_count = seed_count+1;
    seed_pixel = (seed_pixel*seed_count + pixel_list(index,3))/(seed_count+1);
    % �洢λ��
    x = pixel_list(index,1); 
    y = pixel_list(index,2);
    pixel_list(index,:) = pixel_list(pixel_index,:);
    pixel_index = pixel_index-1;
end
% ���ؽ��
J = mat2gray(J);
J = im2bw(J, graythresh(J));
% ͳ�ƺ�ʱ
t2 = cputime;
ts = t2 - t1;