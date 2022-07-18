function output_img(x, y, filename, th, ext)
if nargin < 5
    ext = 'png';
end
[~, file, ~] = fileparts(filename);
foldername = fullfile(pwd, 'output');
if ~exist(foldername, 'dir')
    mkdir(foldername);
end
file1 = fullfile(foldername, sprintf('%s_origin.%s', file, ext));
file2 = fullfile(foldername, sprintf('%s_wave_%.1f.%s', file, th, ext));
imwrite(x, file1);
imwrite(y, file2);
info1 = imfinfo(file1);
info2 = imfinfo(file2);
fprintf('\nѹ��ǰͼ������洢�ռ�Ϊ%.2fbytes', info1.FileSize);
fprintf('\nѹ����ͼ������洢�ռ�Ϊ%.2fbytes', info2.FileSize);
fprintf('\n�ļ���С��Ϊ%.2f', info1.FileSize/info2.FileSize);