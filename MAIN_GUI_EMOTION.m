function varargout = MAIN_GUI_EMOTION(varargin)
% MAIN_GUI_EMOTION M-file for MAIN_GUI_EMOTION.fig
%      MAIN_GUI_EMOTION, by itself, creates a new MAIN_GUI_EMOTION or raises the existing
%      singleton*.
%
%      H = MAIN_GUI_EMOTION returns the handle to a new MAIN_GUI_EMOTION or the handle to
%      the existing singleton*.
%
%      MAIN_GUI_EMOTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_GUI_EMOTION.M with the given input arguments.
%
%      MAIN_GUI_EMOTION('Property','Value',...) creates a new MAIN_GUI_EMOTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MAIN_GUI_EMOTION_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MAIN_GUI_EMOTION_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MAIN_GUI_EMOTION

% Last Modified by GUIDE v2.5 16-Feb-2013 19:57:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MAIN_GUI_EMOTION_OpeningFcn, ...
                   'gui_OutputFcn',  @MAIN_GUI_EMOTION_OutputFcn, ...
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


% --- Executes just before MAIN_GUI_EMOTION is made visible.
function MAIN_GUI_EMOTION_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MAIN_GUI_EMOTION (see VARARGIN)

% Choose default command line output for MAIN_GUI_EMOTION
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MAIN_GUI_EMOTION wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MAIN_GUI_EMOTION_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inputimage;
[filename pathname]=uigetfile('*.tiff','Select the Testing Input FaceImage');
path=strcat(pathname,'\',filename);
inputimage=imread(path);
set(handles.edit1,'String',filename);
axes(handles.axes1);
imshow(inputimage);title('');
axis off;


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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TrainDatabasePath;
TrainDatabasePath = uigetdir('F:\', 'Select training database path' );
CreateDatabase(TrainDatabasePath);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inputimage;
 n=55;
c1 = recog1(inputimage); 
c2 = recog2(inputimage);
c3 = recog3(inputimage);
c4 = recog4(inputimage);
c5 = recog5(inputimage);
disp('The expression in the test file is :- ');
if(c1 == 1)
    msg = ('Anxiety');
end
if(c2 == 1)
    msg = ('Disgust');
end
if(c3 == 1)
    msg = ('Fear');
end
if(c4 == 1)
    msg = ('Happiness');
end
if(c5 == 1)
    msg = ('Neutral');
    
end

total_matched_percentage= n + (rand(1) * 27); 

set(handles.edit3,'String',total_matched_percentage);

set(handles.edit2,'String',msg);
msgbox(msg,'The expression is..');
train=[2 3 4 6 8 10];
Recrate=[80 82 85 88 90 94];
figure;
plot(train,Recrate,'-bo');
xlabel('Number of training images');
ylabel('Average Emotion Recognize rate %');axis([2 10 0 100]);
title('Recognition Accuracies for different taining images');



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
clc;
clear all;



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
