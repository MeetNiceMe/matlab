function varargout = MainForm(varargin)
% MAINFORM MATLAB code for MainForm.fig
%      MAINFORM, by itself, creates a new MAINFORM or raises the existing
%      singleton*.
%
%      H = MAINFORM returns the handle to a new MAINFORM or the handle to
%      the existing singleton*.
%
%      MAINFORM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINFORM.M with the given input arguments.
%
%      MAINFORM('Property','Value',...) creates a new MAINFORM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainForm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainForm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainForm

% Last Modified by GUIDE v2.5 27-May-2022 22:22:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @MainForm_OpeningFcn, ...
    'gui_OutputFcn',  @MainForm_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

function InitAxes(handles)
clc;
axes(handles.axes1); cla reset; axis on; box on;
set(gca, 'XTickLabel', '', 'YTickLabel', '');
axes(handles.axes2); cla reset; axis on; box on;
set(gca, 'XTickLabel', '', 'YTickLabel', '');
axes(handles.axes3); cla reset; axis on; box on;
set(gca, 'XTickLabel', '', 'YTickLabel', '');
set(handles.edit_info, 'String', '');

% --- Executes just before MainForm is made visible.
function MainForm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainForm (see VARARGIN)

% Choose default command line output for MainForm
handles.output = hObject;
InitAxes(handles)
handles.XTrain = 0;
handles.layers = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainForm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainForm_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image_size = [28 28 1];
%获取self_net
layers = get_self_net(image_size);
lgraph = layerGraph(layers);
%输出图片
axes(handles.axes1);
plot(lgraph);
%保存输出结果
handles.layers = layers;
% Update handles structure
guidata(hObject, handles);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.layers, 0)
    return;
end
[XTrain, YTrain, XValidation, YValidation] = load_data();
handles.XTrain = XTrain;
handles.YTrain = YTrain;
handles.XValidation = XValidation;
handles.YValidation = YValidation;
guidata(hObject, handles);
msgbox('数据载入成功！', '提示信息', 'modal');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.XTrain, 0) || isequal(handles.layers, 0)
    return;
end
inputSize = handles.layers(1).InputSize;
imdsTrain = augmentedImageDatastore(inputSize(1:2),handles.XTrain,handles.YTrain);
augimdsValidation = augmentedImageDatastore(inputSize(1:2),handles.XValidation,handles.YValidation);
handles.augimdsValidation = augimdsValidation;
guidata(hObject, handles);
MaxEpochs = round(str2num(get(handles.edit1, 'String')));
InitialLearnRate = str2num(get(handles.edit2, 'String'));
MiniBatchSize = round(str2num(get(handles.edit3, 'String')));
v1 = get(handles.popupmenu1, 'Value');
if v1 == 1
    ExecutionEnvironment = 'auto';
end
if v1 == 2
    ExecutionEnvironment = 'gpu';
end
if v1 == 3
    ExecutionEnvironment = 'cpu';
end
v2 = get(handles.popupmenu2, 'Value');
if v2 == 1
    options_train = trainingOptions('sgdm', ...
    'MiniBatchSize',MiniBatchSize, ...
    'MaxEpochs',MaxEpochs, ...
    'InitialLearnRate',InitialLearnRate, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropFactor',0.1, ...
    'LearnRateDropPeriod',20, ...
    'Shuffle','every-epoch', ...
    'ValidationData',handles.augimdsValidation, ...
    'ValidationFrequency',10, ...
    'Plots','training-progress', ...
    'ExecutionEnvironment', ExecutionEnvironment, ...
    'Verbose',true);    
else
    options_train = trainingOptions('sgdm', ...
    'MiniBatchSize',MiniBatchSize, ...
    'MaxEpochs',MaxEpochs, ...
    'InitialLearnRate',InitialLearnRate, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropFactor',0.1, ...
    'LearnRateDropPeriod',20, ...
    'Shuffle','every-epoch', ...
    'ValidationData',handles.augimdsValidation, ...
    'ValidationFrequency',10, ...
    'ExecutionEnvironment', ExecutionEnvironment, ...
    'Verbose',true);
end
%获取CNN的值
net = trainNetwork(imdsTrain, handles.layers, options_train);
handles.net = net;
guidata(hObject, handles);
msgbox('训练完毕！', '提示信息', 'modal');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.net, 0) || isequal(handles.layers, 0)
    return;
end
%开始时间
t1 = cputime;
%获取数据条数
YPredicted = predict(handles.net,handles.augimdsValidation);
YValidation = handles.YValidation;
%获取出错数据
prediction_error = YValidation - YPredicted;
thr = 10;
%获取正确数量
num_correct = sum(abs(prediction_error) < thr);
num_validation = numel(YValidation);
%获取正确率
accuracy = num_correct/num_validation;
%结束时间
t2 = cputime;
str1 = sprintf('\n测试%d条数据\n耗时=%.2f s\n准确率=%.2f%%', numel(YPredicted), t2-t1, accuracy*100);
ss = get(handles.edit_info, 'String');
ss{end+1} = str1;
set(handles.edit_info, 'String', ss);

function filePath = OpenFile(imgfilePath)
if nargin < 1
    imgfilePath = fullfile(pwd, 'test');
end
[filename, pathname, ~] = uigetfile( ...
    { '*.png','All png Files';...
    '*.jpg','All jpg Files';...
    '*.*',  '所有文件 (*.*)'}, ...
    '选择文件', ...
    'MultiSelect', 'off', ...
    imgfilePath);
filePath = 0;
if isequal(filename, 0) || isequal(pathname, 0)
    return;
end
filePath = fullfile(pathname, filename);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.net, 0) || isequal(handles.layers, 0)
    return;
end
filePath = OpenFile();
if isequal(filePath, 0) 
    return;
end
x = imread(filePath);
xo = x;
inputSize = handles.layers(1).InputSize;
if ~isequal(size(x), inputSize(1:2))
    x = imresize(x, inputSize(1:2), 'bilinear');
end
axes(handles.axes2); imshow(xo, []);
xw = zeros(inputSize(1),inputSize(2), 1, 1);
xw(:,:,1,1) = x(:,:,1);
%开始时间
t1 = cputime;
%获取倾斜角度
yw = predict(handles.net, xw);
xw2 = imrotate(xo,yw,'bicubic','crop');
axes(handles.axes3); imshow(xw2, []);
%结束时间
t2 = cputime;
str1 = sprintf('\n测试1条数据\n耗时=%.2f s\n倾斜角度为%.1f°', t2-t1, yw);
ss = get(handles.edit_info, 'String');
ss{end+1} = str1;
set(handles.edit_info, 'String', ss);
handles.XXX=xw2;
guidata(hObject, handles);


function edit_info_Callback(hObject, eventdata, handles)
% hObject    handle to edit_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_info as text
%        str2double(get(hObject,'String')) returns contents of edit_info as a double


% --- Executes during object creation, after setting all properties.
function edit_info_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%获取alex网络
layers = get_alex_net();
lgraph = layerGraph(layers);
%输出结果
axes(handles.axes1);
plot(lgraph);
handles.layers = layers;
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('确定要退出?', ...
    '退出', ...
    '确定','取消','取消');
switch choice
    case '确定'
        close;
    case '取消'
        return;
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] =  uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
    '*.*','All Files' },'Save Image',...
    fullfile(pwd, 'screen.jpg'));
if isequal(FileName, 0) || isequal(PathName, 0)
    return;
end
f = getframe(gcf);
f = frame2im(f);
imwrite(f, fullfile(PathName, FileName));
msgbox('保存成功！', '提示信息', 'modal');


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load Data.mat;
I = handles.XXX
flag = 1;
I1 = Normalize_Img(I);
bw1 = Bw_Img(I1);
bw1 = ~bw1;
bw2 = Thin_Img(bw1);
bw = bw2;
sz = size(bw);
[r, c] = find(bw==1);
rect = [min(c) min(r) max(c)-min(c) max(r)-min(r)];
vs = rect(1)+rect(3)*[5/12 1/2 7/12];
hs = rect(2)+rect(4)*[1/3 1/2 2/3];
pt1 = [rect(1:2); rect(1:2)+rect(3:4)];
pt2 = [rect(1)+rect(3) rect(2); rect(1) rect(2)+rect(4)];
k1 = (pt1(1,2)-pt1(2,2)) / (pt1(1,1)-pt1(2,1));
x1 = 1:sz(2);
y1 = k1*(x1-pt1(1,1)) + pt1(1,2);
k2 = (pt2(1,2)-pt2(2,2)) / (pt2(1,1)-pt2(2,1));
x2 = 1:sz(2);
y2 = k2*(x2-pt2(1,1)) + pt2(1,2);
if flag
    figure('Name', '数字识别', 'NumberTitle', 'Off', 'Units', 'Normalized', 'Position', [0.2 0.45 0.5 0.3]);
    subplot(2, 2, 1); imshow(I, []); title('原图像', 'FontWeight', 'Bold');
    subplot(2, 2, 2); imshow(I1, []); title('归一化图像', 'FontWeight', 'Bold');
    hold on;
    h = rectangle('Position', [rect(1:2)-1 rect(3:4)+2], 'EdgeColor', 'r', 'LineWidth', 2);
    xlabel('数字区域标记');
    subplot(2, 2, 3); imshow(bw1, []); title('二值化图像', 'FontWeight', 'Bold');
    subplot(2, 2, 4); imshow(bw, [], 'Border', 'Loose'); title('细化图像', 'FontWeight', 'Bold');
    hold on;
    h = [];
    for i = 1 : length(hs)
        h = [h plot([1 sz(2)], [hs(i) hs(i)], 'r-')];
    end
    for i = 1 : length(vs)
        h = [h plot([vs(i) vs(i)], [1 sz(1)], 'g-')];
    end
    h = [h plot(x1, y1, 'y-')];
    h = [h plot(x2, y2, 'm-')];
    legend([h(1) h(4) h(7) h(8)], {'水平线', '竖直线', '左对角线', '右对角线'}, 'Location', 'BestOutside');
    hold off;
end
v{1} = [1:sz(2); repmat(hs(1), 1, sz(2))]';
v{2} = [1:sz(2); repmat(hs(2), 1, sz(2))]';
v{3} = [1:sz(2); repmat(hs(3), 1, sz(2))]';
v{4} = [repmat(vs(1), 1, sz(1)); 1:sz(1)]';
v{5} = [repmat(vs(2), 1, sz(1)); 1:sz(1)]';
v{6} = [repmat(vs(3), 1, sz(1)); 1:sz(1)]';
v{7} = [x1; y1]';
v{8} = [x2; y2]';
for i = 1 : 8
    num(i) = GetImgLinePts(bw, round(v{i})-1);
end
num(9) = sum(sum(endpoints(bw)));
result = MaskRecon(Datas, num);
msgbox(sprintf('识别结果:%d', result), '提示信息', 'modal');


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load Data.mat;
[FileName,PathName,FilterIndex] = uigetfile({'*.jpg;*.tif;*.png;*.gif', ...
    '所有图像文件';...
    '*.*','所有文件' },'载入数字图像',...
    '.\\images\\手写数字\\t0.jpg');
if isequal(FileName, 0) || isequal(PathName, 0)
    return;
end
fileName = fullfile(PathName, FileName);
I = imread(fileName);
flag = 1;
I1 = Normalize_Img(I);
bw1 = Bw_Img(I1);
bw2 = Thin_Img(bw1);
bw = bw2;
sz = size(bw);
[r, c] = find(bw==1);
rect = [min(c) min(r) max(c)-min(c) max(r)-min(r)];
vs = rect(1)+rect(3)*[5/12 1/2 7/12];
hs = rect(2)+rect(4)*[1/3 1/2 2/3];
pt1 = [rect(1:2); rect(1:2)+rect(3:4)];
pt2 = [rect(1)+rect(3) rect(2); rect(1) rect(2)+rect(4)];
k1 = (pt1(1,2)-pt1(2,2)) / (pt1(1,1)-pt1(2,1));
x1 = 1:sz(2);
y1 = k1*(x1-pt1(1,1)) + pt1(1,2);
k2 = (pt2(1,2)-pt2(2,2)) / (pt2(1,1)-pt2(2,1));
x2 = 1:sz(2);
y2 = k2*(x2-pt2(1,1)) + pt2(1,2);
if flag
    figure('Name', '数字识别', 'NumberTitle', 'Off', 'Units', 'Normalized', 'Position', [0.2 0.45 0.5 0.3]);
    subplot(2, 2, 1); imshow(I, []); title('原图像', 'FontWeight', 'Bold');
    subplot(2, 2, 2); imshow(I1, []); title('归一化图像', 'FontWeight', 'Bold');
    hold on;
    h = rectangle('Position', [rect(1:2)-1 rect(3:4)+2], 'EdgeColor', 'r', 'LineWidth', 2);
    xlabel('数字区域标记');
    subplot(2, 2, 3); imshow(bw1, []); title('二值化图像', 'FontWeight', 'Bold');
    subplot(2, 2, 4); imshow(bw, [], 'Border', 'Loose'); title('细化图像', 'FontWeight', 'Bold');
    hold on;
    h = [];
    for i = 1 : length(hs)
        h = [h plot([1 sz(2)], [hs(i) hs(i)], 'r-')];
    end
    for i = 1 : length(vs)
        h = [h plot([vs(i) vs(i)], [1 sz(1)], 'g-')];
    end
    h = [h plot(x1, y1, 'y-')];
    h = [h plot(x2, y2, 'm-')];
    legend([h(1) h(4) h(7) h(8)], {'水平线', '竖直线', '左对角线', '右对角线'}, 'Location', 'BestOutside');
    hold off;
end
v{1} = [1:sz(2); repmat(hs(1), 1, sz(2))]';
v{2} = [1:sz(2); repmat(hs(2), 1, sz(2))]';
v{3} = [1:sz(2); repmat(hs(3), 1, sz(2))]';
v{4} = [repmat(vs(1), 1, sz(1)); 1:sz(1)]';
v{5} = [repmat(vs(2), 1, sz(1)); 1:sz(1)]';
v{6} = [repmat(vs(3), 1, sz(1)); 1:sz(1)]';
v{7} = [x1; y1]';
v{8} = [x2; y2]';
for i = 1 : 8
    num(i) = GetImgLinePts(bw, round(v{i})-1);
end
num(9) = sum(sum(endpoints(bw)));
result = MaskRecon(Datas, num);
msgbox(sprintf('识别结果:%d', result), '提示信息', 'modal');
