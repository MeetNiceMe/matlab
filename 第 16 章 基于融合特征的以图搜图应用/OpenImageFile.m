function filePath = OpenImageFile(imgfilePath)
% ���ļ�
% ���������
% filePath�����ļ�·��

if nargin < 1
    imgfilePath = fullfile(pwd, 'images/im1.bmp');
end
[filename, pathname, ~] = uigetfile( ...
    { '*.bmp;*.jpg;*.tif;*.png;*.gif','All Image Files';...
    '*.*',  '�����ļ� (*.*)'}, ...
    'ѡ����Ƶ�ļ�', ...
    'MultiSelect', 'off', ...
    imgfilePath);
filePath = 0;
if isequal(filename, 0) || isequal(pathname, 0)
    return;
end
filePath = fullfile(pathname, filename);
