function SnapImage()
video_imagesPath = fullfile(pwd, 'snap_images');
if ~exist(video_imagesPath, 'dir')
    mkdir(video_imagesPath);
end
[FileName,PathName,FilterIndex] = uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'�����ͼ',...
          fullfile(pwd, 'snap_images\\temp.jpg'));
if isequal(FileName, 0) || isequal(PathName, 0)
    return;
end
fileStr = fullfile(PathName, FileName);
f = getframe(gcf);
f = frame2im(f);
imwrite(f, fileStr);
msgbox('ץͼ�ļ�����ɹ���', '��ʾ��Ϣ');