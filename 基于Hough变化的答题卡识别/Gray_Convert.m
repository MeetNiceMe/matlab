function I1 = Gray_Convert(I, flag,hObject, eventdata, handles)

if nargin < 2
    flag = 1;
end
if ndims(I) == 3
    I1 = rgb2gray(I);
else
    I1 = I;
end
set(handles.text2,'string','»Ò¶ÈÍ¼Ïñ');
imshow(I1, [], 'parent',handles.axes1)
imshow(I1, [], 'parent',handles.axes3)