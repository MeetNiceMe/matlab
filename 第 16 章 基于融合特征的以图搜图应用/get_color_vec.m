function vec = get_color_vec(im)
% ��ȡhsv�ռ����
hsv = rgb2hsv(im);
h = hsv(:,:,1);
s = hsv(:,:,2);
v = hsv(:,:,3);
% ��h�任Ϊ�Ƕȿռ�
h = h*360;
hm = zeros(size(h));
sm = zeros(size(s));
vm = zeros(size(v));
% H����8������
ts = [20 40 75 155 190 271 295 315];
for i = 1 : 8
    if i == 1
        hm(h<=ts(i) | h>ts(end)) = i-1;
    end
    if i > 1
        hm(h<=ts(i) & h>ts(i-1)) = i-1;
    end
end
% S����3������
ts = [0 0.2 0.7 1];
for i = 1 : 3
    sm(s<=ts(i+1) & s>ts(i)) = i-1;
end
% V����3������
ts = [0 0.2 0.7 1];
for i = 1 : 3
    vm(v<=ts(i+1) & v>ts(i)) = i-1;
end
% ��Ȩ����
hsvm = 9*hm + 3*sm + vm;
hsvw = zeros(size(hsvm));
% L����12������
ts = 0 : 6 : 72;
for i = 1 : 12
    hsvw(hsvm<=ts(i+1) & hsvm>ts(i)) = i-1;
end
vec = zeros(1, 12);
for i = 1 : 12
    % ͳ��ֱ��ͼ
    hsvwi = find(hsvw==i-1);
    vec(i+1) = numel(hsvwi);
end
% ��һ������
vec = vec ./ sum(vec);
