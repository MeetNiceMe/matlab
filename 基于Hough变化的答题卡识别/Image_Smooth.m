function I2 = Image_Smooth(I1, hsize, sigma, flag,hObject, eventdata, handles)

if nargin < 4
    flag = 1;
end
if nargin < 2
    hsize = [3 3];
    sigma = 0.5;
end
h = fspecial('gaussian', hsize, sigma);
I2 = imfilter(I1, h, 'replicate');
set(handles.text2,'string','Æ½»¬ºóµÄÍ¼Ïñ');
imshow(I2, [], 'parent',handles.axes1);