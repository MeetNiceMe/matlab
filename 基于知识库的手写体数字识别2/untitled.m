function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 24-May-2022 22:52:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
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
[FileName,PathName,FilterIndex] = uigetfile({'*.jpg;*.tif;*.png;*.gif', ...
    '所有图像文件';...
    '*.*','所有文件' },'载入数字图像',...
    '.\\images\\手写数字\\t0.jpg');
if isequal(FileName, 0) || isequal(PathName, 0)
    return;
end
fileName = fullfile(PathName, FileName);
I = imread(fileName);
imshow(I, [], 'parent', handles.axes2);
handles.I = I;
set(handles.text11,'string',PathName);
guidata(hObject, handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag = 1;
I=handles.I;
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
imshow(I1, [], 'parent',handles.axes3); 


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = handles.I;
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
 imshow(bw1, [], 'parent',handles.axes4); 


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = handles.I;
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
imshow(bw, [], 'Border', 'Loose');
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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load Data.mat;
I = handles.I;
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
set(handles.text9,'string',result);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('确定要退出系统?', ...
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
