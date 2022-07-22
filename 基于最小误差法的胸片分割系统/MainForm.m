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

% Last Modified by GUIDE v2.5 02-May-2017 08:10:18

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
axes(handles.axes1); cla reset;
set(handles.axes1, 'XTick', [], 'YTick', [], ...
    'XTickLabel', '', 'YTickLabel', '', 'Color', [0.7020 0.7804 1.0000], 'Box', 'On');
axes(handles.axes2); cla reset;
set(handles.axes2, 'XTick', [], 'YTick', [], ...
    'XTickLabel', '', 'YTickLabel', '', 'Color', [0.7020 0.7804 1.0000], 'Box', 'On');

function filePath = OpenFile(imgfilePath)
% ���ļ�
% ���������
% filePath�����ļ�·��

if nargin < 1
    imgfilePath = fullfile(pwd, 'images/test.jpg');
end
[filename, pathname, ~] = uigetfile( ...
    { '*.jpg','All jpg Files';...
    '*.png','All png Files';...
    '*.*',  '�����ļ� (*.*)'}, ...
    'ѡ���ļ�', ...
    'MultiSelect', 'off', ...
    imgfilePath);
filePath = 0;
if isequal(filename, 0) || isequal(pathname, 0)
    return;
end
filePath = fullfile(pathname, filename);

% --- Executes just before MainForm is made visible.
function MainForm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainForm (see VARARGIN)

% Choose default command line output for MainForm
handles.output = hObject;
InitAxes(handles);
handles.I = 0;
handles.J = 0;
handles.bw_direct = 0;
handles.bw_poly = 0;
handles.bw__kittler = 0;
handles.bw_temp = 0;
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
filePath = OpenFile();
if isequal(filePath, 0)
    return;
end
Img = imread(filePath);
% �ҶȻ�
if ndims(Img) == 3
    I = rgb2gray(Img);
else
    I = Img;
end
axes(handles.axes1);
imshow(I, []);
title('ԭͼ��');
handles.I = I;
guidata(hObject, handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.I, 0)
    return;
end
% ֱ�Ӷ�ֵ��
bw_direct = im2bw(handles.I, graythresh(handles.I));
axes(handles.axes2);
imshow(bw_direct, []);
title('ֱ�Ӷ�ֵ���ָ�');
handles.bw_direct = bw_direct;
guidata(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.bw_direct, 0)
    return;
end
% Ȧѡθ�������
c = [1524 1390 1454 1548 1652 1738 1725 1673 1524];
r = [1756 1909 2037 2055 1997 1863 1824 1787 1756];
bw_poly = roipoly(handles.bw_direct, c, r);
axes(handles.axes2);
imshow(handles.I, []);
hold on;
plot(c, r, 'r-', 'LineWidth', 2);
hold off;
title('��������ѡ��');
handles.bw_poly = bw_poly;
guidata(hObject, handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.bw_poly, 0)
    return;
end
% ͼ���һ��
IE = mat2gray(handles.I);
% �Աȶ���ǿ
IE = imadjust(IE, [0.532 0.72], [0 1]);
IE = im2uint8(mat2gray(IE));
I = im2uint8(mat2gray(handles.I));
% ��ʾ
axes(handles.axes2);
imshow(IE, []);
title('ͼ����ǿ');
figure;
subplot(2, 2, 1); imshow(I); title('ԭͼ��');
subplot(2, 2, 2); imshow(IE); title('��ǿͼ��');
subplot(2, 2, 3); imhist(I); title('ԭͼ��ֱ��ͼ');
subplot(2, 2, 4); imhist(IE); title('��ǿͼ��ֱ��ͼ');
JE = IE;
JE(handles.bw_poly) = 255;
handles.JE = JE;
guidata(hObject, handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.JE, 0)
    return;
end
J = handles.JE;
% ֱ��ͼͳ��
[counts, gray_style] = imhist(J);
% ���ȼ���
gray_level = length(gray_style);
% ������Ҷȸ���
gray_probability  = counts ./ sum(counts);
% ͳ�����ؾ�ֵ
gray_mean = gray_style' * gray_probability;
% ��ʼ��
gray_vector = zeros(gray_level, 1);
w = gray_probability(1);
mean_k = 0;
gray_vector(1) = realmax;
ks = gray_level-1;
for k = 1 : ks
    % ��������
    w = w + gray_probability(k+1);
    mean_k = mean_k + k * gray_probability(k+1);
    % �ж��Ƿ�����
    if (w < eps) || (w > 1-eps)
        gray_vector(k+1) = realmax;
    else
        % �����ֵ
        mean_k1 = mean_k / w;
        mean_k2 = (gray_mean-mean_k) / (1-w);
        % ���㷽��
        var_k1 = (((0 : k)'-mean_k1).^2)' * gray_probability(1 : k+1);
        var_k1 = var_k1 / w;
        var_k2 = (((k+1 : ks)'-mean_k2).^2)' * gray_probability(k+2 : ks+1);
        var_k2 = var_k2 / (1-w);
        % ����Ŀ�꺯��
        if var_k1 > eps && var_k2 > eps
            gray_vector(k+1) = 1+w * log(var_k1)+(1-w) * log(var_k2)-2*w*log(w)-2*(1-w)*log(1-w);
        else
            gray_vector(k+1) = realmax;
        end
    end
end
% ��ֵͳ��
min_gray_index = find(gray_vector == min(gray_vector));
min_gray_index = mean(min_gray_index);
% ������ֵ
threshold_kittler = (min_gray_index-1)/ks;
% ��ֵ�ָ�
bw__kittler = im2bw(J, threshold_kittler);
axes(handles.axes2);
imshow(bw__kittler, []);
title('��С���ָ�');
handles.bw__kittler = bw__kittler;
guidata(hObject, handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.bw__kittler, 0)
    return;
end
% ��̬ѧ����
bw_temp = handles.bw__kittler;
% ��ɫ
bw_temp = ~bw_temp;
% ���׶�
bw_temp = imfill(bw_temp, 'holes');
% ȥ��
bw_temp = imclose(bw_temp, strel('disk', 5));
bw_temp = imclearborder(bw_temp);
% ������
[L, ~] = bwlabel(bw_temp);
% ��������
stats = regionprops(L);
Ar = cat(1, stats.Area);
% ��ȡĿ�겢����
[~, ind] = sort(Ar, 'descend');
bw_temp(L ~= ind(1) & L ~= ind(2)) = 0;
% ȥ��
bw_temp = imclose(bw_temp, strel('disk',20));
bw_temp = imfill(bw_temp, 'holes');
axes(handles.axes2);
imshow(bw_temp, []);
title('��̬ѧȥ��');
handles.bw_temp = bw_temp;
guidata(hObject, handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.bw_temp, 0)
    return;
end
% ��ȡ�α�Ե
ed = bwboundaries(handles.bw_temp);
axes(handles.axes2);
imshow(handles.I, []); hold on;
for k = 1 : length(ed)
    % ��Ե
    boundary = ed{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2);
end
hold off;
title('�α�Ե��ʾ���');

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('ȷ��Ҫ�˳�ϵͳ?', ...
    '�˳�', ...
    'ȷ��','ȡ��','ȡ��');
switch choice
    case 'ȷ��'
        close all;
    case 'ȡ��'
        return;
end
