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

% Last Modified by GUIDE v2.5 17-May-2022 22:08:42

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
handles.filePath = 0;
handles.vec_hu = 0;
handles.vec_color = 0;
handles.Img = 0;
handles.ind_dis_sort = 0;
handles.page = 0;
handles.H = 0;
% Update handles structure
guidata(hObject, handles);
% javaFrame = get(hObject, 'JavaFrame');
% javaFrame.setFigureIcon(javax.swing.ImageIcon('MainForm.jpg'));
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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.page < 2
    return;
end
page = handles.page;
ind_dis_sort = handles.ind_dis_sort;
H = handles.H;
page = page - 1;
st = (page-1)*8+1;
et = page*8;
for i = st : et
    file = fullfile(pwd, sprintf('%s', H(ind_dis_sort(i)).filename));
    Img = imread(file);
    imshow(Img, [], 'parent', eval(sprintf('handles.axes%d', (i-(page-1)*8)+1)));
    axes(eval(sprintf('handles.axes%d', (i-(page-1)*8)+1)));
    title(sprintf('%02d', i));
end
handles.ind_dis_sort = ind_dis_sort;
handles.page = page;
guidata(hObject, handles);
set(handles.textpage, 'String', sprintf('��%dҳ/��2ҳ', page));

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.page >= 2
    return;
end
page = handles.page;
ind_dis_sort = handles.ind_dis_sort;
H = handles.H;
page = page + 1;
st = (page-1)*8+1;
et = page*8;
for i = st : et
    file = fullfile(pwd, sprintf('%s', H(ind_dis_sort(i)).filename));
    Img = imread(file);
    imshow(Img, [], 'parent', eval(sprintf('handles.axes%d', (i-(page-1)*8)+1)));
    axes(eval(sprintf('handles.axes%d', (i-(page-1)*8)+1)));
    title(sprintf('%02d', i));
end
handles.ind_dis_sort = ind_dis_sort;
handles.page = page;
guidata(hObject, handles);
set(handles.textpage, 'String', sprintf('��%dҳ/��2ҳ', page));

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
start_path = fullfile(pwd, 'database');
dialog_title = 'ѡ�����ݿ�';
folder_name = uigetdir(start_path,dialog_title);
if isequal(folder_name, 0)
    return;
end
db_file = fullfile(folder_name, 'H.mat');
if ~exist(db_file, 'file')
    msgbox('δ�ҵ��������ݿ⣬�����������ȡ������', '��ʾ��Ϣ');
    return;
end
load(db_file);
set(handles.text4,'string',db_file);
handles.folder_name = folder_name;
handles.H = H;
guidata(hObject, handles);
msgbox('ѡ�����ݿ�ɹ���', '��ʾ��Ϣ');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.Img, 0)
    return;
end
vec_hu = get_hu_vec(handles.Img);
handles.vec_hu = vec_hu;
set(handles.text7,'string',vec_hu);
guidata(hObject, handles);
msgbox('��ȡHu�����ɹ���', '��ʾ��Ϣ');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.Img, 0)
    return;
end
vec_color = get_color_vec(handles.Img);
handles.vec_color = vec_color;
set(handles.text10,'string',vec_color);
guidata(hObject, handles);
msgbox('��ȡ��ɫ�����ɹ���', '��ʾ��Ϣ');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.vec_hu, 0) || isequal(handles.vec_color, 0)
    return;
end
ind_dis_sort = SearchResult(handles.vec_hu, handles.vec_color, handles.H);
H = handles.H;
page = 0;
page = page + 1;
st = (page-1)*8+1;
et = page*8;
for i = st : et
    file = fullfile(pwd, sprintf('%s', H(ind_dis_sort(i)).filename));
    Img = imread(file);
    imshow(Img, [], 'parent', eval(sprintf('handles.axes%d', (i-(page-1)*8)+1)));
    axes(eval(sprintf('handles.axes%d', (i-(page-1)*8)+1)));
    title(sprintf('%02d', i));
end
handles.ind_dis_sort = ind_dis_sort;
handles.page = page;
guidata(hObject, handles);
set(handles.textpage, 'String', sprintf('��%dҳ/��2ҳ', page));

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('ȷ��Ҫ�˳�ϵͳ?', ...
    '�˳�', ...
    'ȷ��','ȡ��','ȡ��');
switch choice
    case 'ȷ��'
        close;
    case 'ȡ��'
        return;
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filePath = OpenImageFile();
if isequal(filePath, 0)
    return;
end
if ~isequal(handles.filePath, 0)
    InitAxes(handles);
end
handles.filePath = 0;
handles.vi = 0;
handles.Img = 0;
handles.ind_dis_sort = 0;
handles.page = 0;

[Img, map] = imread(filePath);
if ~isempty(map)
    Img = ind2rgb(Img, map);
end
imshow(Img, [], 'parent', handles.axes1);
handles.filePath = filePath;
set(handles.text6,'string',filePath);
handles.Img = Img;
guidata(hObject, handles);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filePath = OpenImageFile();
if isequal(filePath, 0)
    return;
end
if ~isequal(handles.filePath, 0)
    InitAxes(handles);
end
handles.filePath = 0;
handles.vi = 0;
handles.Img = 0;
handles.ind_dis_sort = 0;
handles.page = 0;

[Img, map] = imread(filePath);
if ~isempty(map)
    Img = ind2rgb(Img, map);
end
imshow(Img, [], 'parent', handles.axes1);
handles.filePath = filePath;
set(handles.text6,'string',filePath);
handles.Img = Img;


[filename, pathname] = uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
    '*.*','All Files' }, '������', ...
    'Result\result.jpg');
if isempty(filename)
    return;
end
file = fullfile(pathname, filename);
imwrite(Img, file);

foldename = fullfile(pwd, 'database');
filename_list = ls(fullfile(foldename, '*.*'));
H = [];
for i = 1 : size(filename_list, 1)
    filename = fullfile(foldename, strtrim(filename_list(i, :)))
    [~, ~, ext] = fileparts(filename);
    if isequal(ext, '.') || isequal(ext, '..') || isequal(ext, '.mat')
        continue;
    end
    [Img, map] = imread(filename);
    if ~isempty(map)
        Img = ind2rgb(Img, map);
    end
    % Hu���������
    vec_hu = get_hu_vec(Img);
    % ��ɫ��������
    vec_color = get_color_vec(Img);
    [~, name, ext] = fileparts(filename);
    h.vec_hu = vec_hu;
    h.vec_color = vec_color;
    h.filename = sprintf('./database/%s%s', name, ext);
    H = [H h];
end


save(fullfile(pwd, 'database/H.mat'), 'H');

msgbox('����ͼ��ɹ���', '��ʾ��Ϣ', 'modal');


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.Img, 0)
    return;
end
vec_hu = get_hu_vec(handles.Img);
handles.vec_hu = vec_hu;
set(handles.text7,'string',vec_hu);
guidata(hObject, handles);
if isequal(handles.Img, 0)
    return;
end
vec_color = get_color_vec(handles.Img);
handles.vec_color = vec_color;
set(handles.text10,'string',vec_color);
guidata(hObject, handles);
if isequal(handles.vec_hu, 0) || isequal(handles.vec_color, 0)
    return;
end
ind_dis_sort = SearchResult(handles.vec_hu, handles.vec_color, handles.H);
H = handles.H;
page = 0;
page = page + 1;
st = (page-1)*8+1;
et = page*8;
for i = st : et
    file = fullfile(pwd, sprintf('%s', H(ind_dis_sort(i)).filename));
    Img = imread(file);
    imshow(Img, [], 'parent', eval(sprintf('handles.axes%d', (i-(page-1)*8)+1)));
    axes(eval(sprintf('handles.axes%d', (i-(page-1)*8)+1)));
    title(sprintf('%02d', i));
end
handles.ind_dis_sort = ind_dis_sort;
handles.page = page;
guidata(hObject, handles);
set(handles.textpage, 'String', sprintf('��%dҳ/��2ҳ', page));
