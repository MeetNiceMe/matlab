function InitFig(hObject,handles)
axes(handles.axes1); 
cla; axis on; box on;
set(gca, 'Color', [0.8039 0.8784 0.9686]);
set(gca, 'XTickLabel', [], 'YTickLabel', [], 'XTick', [], 'YTick', []);
axes(handles.axes2); 
cla; axis on; box on;
set(gca, 'Color', [0.8039 0.8784 0.9686]);
set(gca, 'XTickLabel', [], 'YTickLabel', [], 'XTick', [], 'YTick', []);
set(handles.textInfo, 'String', ...
    'ͼ��ѹ��ϵͳ������ͼ��ѡ��ѹ���㷨���Ƚ�ѹ��Ч����');