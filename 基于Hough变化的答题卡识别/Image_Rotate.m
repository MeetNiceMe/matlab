function [I1, bw1] = Image_Rotate(I, bw, angle, flag,hObject, eventdata, handles)

if nargin < 4
    flag = 1;
end
I1 = imrotate(I, -90-angle, 'bilinear');
bw1 = imrotate(bw, -90-angle, 'bilinear');
set(handles.text2,'string','½ÃÕýÍ¼Ïñ');
imshow(I1, [], 'parent',handles.axes1)
imshow(bw1, [], 'parent',handles.axes5)
