function ind_dis_sort = SearchResult(vec_hu, vec_color, H)
% ͼ�����
vec_hus = cat(1, H.vec_hu);
vec_colors = cat(1, H.vec_color);
% �ֱ����Hu����ɫ�ľ������
vec_hu = repmat(vec_hu, size(vec_hus, 1), 1);
vec_color = repmat(vec_color, size(vec_colors, 1), 1);
dis_hu = sum((vec_hu-vec_hus).^2, 2);
dis_color = sum((vec_color-vec_colors).^2, 2);
% ��������Ȩ�ں�
rate = 0.3;
dis = rate*mat2gray(dis_hu) + (1-rate)*mat2gray(dis_color);
% ���򣬽����Ʋ����С�ģ�����ǰ��
[~, ind_dis_sort] = sort(dis);