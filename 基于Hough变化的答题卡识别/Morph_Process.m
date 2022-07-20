function [bw2, Loc] = Morph_Process(bw1, flag,hObject, eventdata, handles)

if nargin < 2
    flag = 1;
end
bw2 = bwareaopen(bw1, round(0.005*numel(bw1)/100));
bws = sum(bw2);
inds = find(bws>round(sum(bw2(:))*0.015));
Loc = inds(1)-5;
bw2(:, Loc:end) = 0;
bw2 = bwareaopen(bw2, round(0.005*numel(bw1)/100));
set(handles.text2,'string','ÂË²¨Í¼Ïñ');
imshow(bw2, [], 'parent',handles.axes1)