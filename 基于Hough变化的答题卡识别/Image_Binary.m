function bw2 = Image_Binary(I, flag,hObject, eventdata, handles)

if nargin < 2
    flag = 1;
end
bw1 = im2bw(I, graythresh(I));
bw2 = ~bw1;
set(handles.text2,'string','��ֵ����ɫͼ��');
imshow(bw2, [], 'parent',handles.axes1)
imshow(bw2, [], 'parent',handles.axes4)
