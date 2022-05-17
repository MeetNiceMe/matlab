function Watershed_Fun(fileName)

rgb = imread(fileName);
if ndims(rgb) == 3
    I = rgb2gray(rgb);
else    
    I = rgb;
end
sz = size(I);
if sz(1) ~= 256
    I = imresize(I, 256/sz(1));
    rgb = imresize(rgb, 256/sz(1));
end
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(I), hy, 'replicate');
Ix = imfilter(double(I), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
se = strel('disk', 3);
Io = imopen(I, se);
Ie = imerode(I, se);
Iobr = imreconstruct(Ie, I);
Ioc = imclose(Io, se);
Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
fgm = imregionalmax(Iobrcbr);
se2 = strel(ones(3,3));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);
fgm4 = bwareaopen(fgm3, 15);
bw = im2bw(Iobrcbr, graythresh(Iobrcbr));
D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;
gradmag2 = imimposemin(gradmag, bgm | fgm4);
L = watershed(gradmag2);
Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');

[pathstr, name, ext] = fileparts(fileName);
filefolder = fullfile(pwd, 'ʵ����', [name, '_ʵ���ͼ']);
if ~exist(filefolder, 'dir')
    mkdir(filefolder);
end
h1 = figure(1);
set(h1, 'Name', 'ͼ��ҶȻ�', 'NumberTitle', 'off');
subplot(1, 2, 1); imshow(rgb, []); title('ԭͼ��');
subplot(1, 2, 2); imshow(I, []); title('�Ҷ�ͼ��');
fileurl = fullfile(filefolder, '1');
set(h1,'PaperPositionMode','auto');
print(h1,'-dtiff','-r200',fileurl);
h2 = figure(2);
set(h2, 'Name', 'ͼ����̬ѧ����', 'NumberTitle', 'off');
subplot(1, 2, 1); imshow(Iobrcbr, []); title('ͼ����̬ѧ����');
subplot(1, 2, 2); imshow(bw, []); title('ͼ���ֵ��');
fileurl = fullfile(filefolder, '2');
set(h2,'PaperPositionMode','auto');
print(h2,'-dtiff','-r200',fileurl);
h3 = figure(3);
set(h3, 'Name', 'ͼ���ݶ���ʾ', 'NumberTitle', 'off');
subplot(1, 2, 1); imshow(rgb, []); title('������ͼ��');
subplot(1, 2, 2); imshow(gradmag, []); title('�ݶ�ͼ��');
fileurl = fullfile(filefolder, '3');
set(h3,'PaperPositionMode','auto');
print(h3,'-dtiff','-r200',fileurl);
h4 = figure(4); imshow(rgb, []); hold on;
himage = imshow(Lrgb);
set(h4, 'Name', 'ͼ���ˮ��ָ�', 'NumberTitle', 'off');
set(himage, 'AlphaData', 0.3);
hold off;
fileurl = fullfile(filefolder, '4');
set(h4,'PaperPositionMode','auto');
print(h4,'-dtiff','-r200',fileurl);