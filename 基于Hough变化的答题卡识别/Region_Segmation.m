function [bw1, bw2] = Region_Segmation(XY, bw, Img, flag,hObject, eventdata, handles)

if nargin < 4
    flag = 1; 
end

for i = 1 : 2
    xy = XY{i}; 
    XY{i} = [1 xy(1, 2); size(bw, 2) xy(2, 2)];
    ri(i) = round(mean([xy(1,2) xy(2,2)]));
end
minr = min(ri);
maxr = max(ri);
bw1 = bw; bw2 = bw;
bw1(1:minr+5, :) = 0;
bw1(maxr-5:end, :) = 0;
bw2(minr-5:end, :) = 0;
bw2(1:round(minr*0.5), :) = 0;
set(handles.text2,'string','Ô­¶þÖµÍ¼Ïñ');
imshow(bw, [], 'parent',handles.axes1)
imshow(bw2, [], 'parent',handles.axes6)
imshow(bw1, [], 'parent',handles.axes7)