function Video2Images(videoFilePath)
clc;
nFrames = GetVideoImgList(videoFilePath);

function nFrames = GetVideoImgList(videoFilePath)
xyloObj = VideoReader(videoFilePath);
nFrames = xyloObj.NumberOfFrames;
video_imagesPath = fullfile(pwd, 'video_images');
if ~exist(video_imagesPath, 'dir')
    mkdir(video_imagesPath);
end
files = dir(fullfile(video_imagesPath, '*.jpg'));
if length(files) == nFrames
    return;
end
h = waitbar(0, '', 'Name', '��ȡ��Ƶͼ������...');
steps = nFrames;
for step = 1 : nFrames
    temp = read(xyloObj, step);
    temp_str = sprintf('%s\\%03d.jpg', video_imagesPath, step);
    imwrite(temp, temp_str);
    pause(0.01);
    waitbar(step/steps, h, sprintf('�Ѵ���%d%%', round(step/nFrames*100)));
end
close(h)