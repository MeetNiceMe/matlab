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

% Last Modified by GUIDE v2.5 05-Jun-2022 19:38:48

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
I=handles.I
I1 = Image_Normalize(I, 1,hObject, eventdata, handles);
handles.I1=I1;
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I1=handles.I1;
hsize = [3 3];
sigma = 0.5;
I2 = Image_Smooth(I1, hsize, sigma, 1,hObject, eventdata, handles);
handles.I2=I2;
guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I2=handles.I2
I3 = Gray_Convert(I2, 1,hObject, eventdata, handles);
handles.I3=I3;
guidata(hObject, handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I3=handles.I3;
bw2 = Image_Binary(I3, 1,hObject, eventdata, handles);
handles.bw2=bw2;
guidata(hObject, handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I1=handles.I1;
bw2=handles.bw2;
[~, ~, xy_long] = Hough_Process(bw2, I1, 1,hObject, eventdata, handles);
angle = Compute_Angle(xy_long);
handles.angle=angle;
guidata(hObject, handles);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
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
imshow(I, [], 'parent', handles.axes1);
imshow(I, [], 'parent',handles.axes2)
handles.I = I;
guidata(hObject, handles);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I1=handles.I1;
bw2=handles.bw2;
angle=handles.angle;
[I4, bw3] = Image_Rotate(I1, bw2, angle*1.8, 1,hObject, eventdata, handles);
handles.bw3=bw3;
handles.I4=I4;
guidata(hObject, handles);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw3=handles.bw3;
[bw4, Loc1] = Morph_Process(bw3, 1,hObject, eventdata, handles);
handles.bw4=bw4;
handles.Loc1=Loc1;
guidata(hObject, handles);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw4=handles.bw4;
I4=handles.I4;
[Len, XYn, xy_long] = Hough_Process(bw4, I4, 1,hObject, eventdata, handles);
handles.Len=Len;
handles.XYn=XYn;
handles.xy_long=xy_long;
guidata(hObject, handles);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
XYn=handles.XYn;
bw4=handles.bw4;
I4=handles.I4;
[bw5, bw6] = Region_Segmation(XYn, bw4, I4, 1,hObject, eventdata, handles);
handles.bw5=bw5;
handles.bw6=bw6;
guidata(hObject, handles);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw5=handles.bw5;
bw6=handles.bw6;
I4=handles.I4;
XYn=handles.XYn;
Loc1=handles.Loc1;
[stats1, stats2, Line] = Location_Label(bw5, bw6, I4, XYn, Loc1, 1);
handles.stats1=stats1;
handles.stats2=stats2;
handles.Line=Line;
Ix = imread('images\\1.png');
imshow(Ix, [], 'parent',handles.axes1)
imshow(Ix, [], 'parent',handles.axes8)
set(handles.text2,'string','标记图像');
guidata(hObject, handles);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stats2=handles.stats2;
stats1=handles.stats1;
Line=handles.Line;
I4=handles.I4;
[Dom, Aom, Answer, Bn,s] = Analysis(stats1, stats2, Line, I4);
Ix = imread('images\\2.png');
imshow(Ix, [], 'parent',handles.axes10)
Iy = imread('images\\3.png');
imshow(Iy, [], 'parent',handles.axes10)
imshow(Iy, [], 'parent',handles.axes1)
set(handles.text13,'string',s);
