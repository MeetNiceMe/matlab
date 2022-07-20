function I1 = Image_Normalize(I, flag,hObject, eventdata, handles)

if nargin < 2
    flag = 1;
end
if size(I, 1) > 2000
    I = imresize(I, 0.2, 'bilinear');
end
I1 = imadjust(I, [0 0.6], [0 1]);

if flag
    imshow(I1, [], 'parent',handles.axes1)
    imshow(I1, [], 'parent',handles.axes9)
    set(handles.text2,'string','¹éÒ»»¯Í¼Ïñ');
end
