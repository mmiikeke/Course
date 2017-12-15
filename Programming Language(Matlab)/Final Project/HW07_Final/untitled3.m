function varargout = untitled3(varargin)
% UNTITLED3 MATLAB code for untitled3.fig
%      UNTITLED3, by itself, creates a new UNTITLED3 or raises the existing
%      singleton*.
%
%      H = UNTITLED3 returns the handle to a new UNTITLED3 or the handle to
%      the existing singleton*.
%
%      UNTITLED3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED3.M with the given input arguments.
%
%      UNTITLED3('Property','Value',...) creates a new UNTITLED3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled3

% Last Modified by GUIDE v2.5 16-Dec-2015 03:49:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled3_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled3_OutputFcn, ...
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


% --- Executes just before untitled3 is made visible.
function untitled3_OpeningFcn(hObject, eventdata, handles, varargin)
% Correct function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled3 (see VARARGIN)

% Choose default command line output for untitled3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
for k = 1:25
    Ba=imread(sprintf('A-%d.jpg',k));
    set(handles.(sprintf('B%d',k)),'cdata',Ba);
end
creep=imread('creep.jpg');
set(handles.creep,'cdata',creep);

pic = axes('position', [0 0 1 1]); % 創造axis來放背景
image(imread('th.jpg')); % import the background image and show it on the axes
set(pic,'visible','off') % axis有座標，把它隱形
uistack(pic, 'bottom');  % 把圖層移到最下面



% UIWAIT makes untitled3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from correct function are returned to the command line.
function varargout = untitled3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bits =  [[1,3,5,7,9,11,13,15,17,19,21,23,25];
    [2,3,6,7,10,11,14,15,18,19,22,23,0]; 
    [4,5,6,7,12,13,14,15,20,21,22,23,0]; 
    [8,9,10,11,12,13,14,15,24,25,0,0,0];
    [16,17,18,19,20,21,22,23,24,25,0,0,0]];
Xpos1 = [7;7;28.4;7;28.4;49.8;71.2;92.6;7;28.4;49.8;71.2;92.6];
Ypos1 = [25.5;17.5;17.5;9.5;9.5;9.5;9.5;9.5;1.5;1.5;1.5;1.5;1.5];
Xpos2 = [7;28.4;7;28.4;49.8;71.2;92.6;7;28.4;49.8;71.2;92.6];
Ypos2 = [17.5;17.5;9.5;9.5;9.5;9.5;9.5;1.5;1.5;1.5;1.5;1.5];
Xpos3 = [7;28.4;49.8;71.2;92.6;7;28.4;49.8;71.2;92.6];
Ypos3 = [9.5;9.5;9.5;9.5;9.5;1.5;1.5;1.5;1.5;1.5];
Tar = 0;
set(handles.Begin,'visible','Off');
set(handles.Start,'visible','Off');
set(handles.Exit,'visible','Off');
set(handles.checkbox1,'visible','On');
set(handles.Next,'visible','On');

for L = 1:5
    for k = 1:25 set(handles.(sprintf('B%d',k)),'visible','Off');  
    end
    if L == 1
        ordering1 = randperm(13);
        for j = 1:13
            X = Xpos1(ordering1(j)); 
            Y = Ypos1(ordering1(j)); 
            set(handles.(sprintf('B%d',bits(L,j))),'visible','On'); 
            set(handles.(sprintf('B%d',bits(L,j))),'Position',[X Y 18.1 6.9]);
        end
    elseif L <=3
        ordering2 = randperm(12);
        for j = 1:12
            X = Xpos2(ordering2(j)); 
            Y = Ypos2(ordering2(j)); 
            set(handles.(sprintf('B%d',bits(L,j))),'visible','On'); 
            set(handles.(sprintf('B%d',bits(L,j))),'Position',[X Y 18.1 6.9]);
        end
    else
        ordering3 = randperm(10);
        for j = 1:10
            X = Xpos3(ordering3(j)); 
            Y = Ypos3(ordering3(j)); 
            set(handles.(sprintf('B%d',bits(L,j))),'visible','On'); 
            set(handles.(sprintf('B%d',bits(L,j))),'Position',[X Y 18.1 6.9]);
        end
    end
    set(handles.checkbox1,'value',0);
    set(handles.Next,'value',0);
    done = get(handles.Next,'value');

    while done == 0
          pause(0.2);
          done = get(handles.Next,'value');
    end
    g = get(handles.checkbox1,'value');
    if g == 1 
       Tar = Tar + bits(L,1) 
    end
end

for k = 1:25 
    set(handles.(sprintf('B%d',k)),'visible','Off'); 
end
    
set(handles.checkbox1,'visible','Off');
set(handles.Next,'visible','Off');
set(handles.Exit,'visible','On');
set(handles.Restart,'visible','On');
    
if Tar > 25 || Tar == 0 
   set(handles.Wrong,'visible','On');
   set(handles.creep,'visible','On');
else
   set(handles.Correct,'visible','On');
   set(handles.(sprintf('B%d',Tar)),'visible','On','Position',[40,15,18.1,6.9]);
end



% --- Executes on button press in B1.
function B1_Callback(hObject, eventdata, handles)
% hObject    handle to B1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B6.
function B6_Callback(hObject, eventdata, handles)
% hObject    handle to B6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B11.
function B11_Callback(hObject, eventdata, handles)
% hObject    handle to B11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B16.
function B16_Callback(hObject, eventdata, handles)
% hObject    handle to B16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B21.
function B21_Callback(hObject, eventdata, handles)
% hObject    handle to B21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B2.
function B2_Callback(hObject, eventdata, handles)
% hObject    handle to B2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B3.
function B3_Callback(hObject, eventdata, handles)
% hObject    handle to B3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B4.
function B4_Callback(hObject, eventdata, handles)
% hObject    handle to B4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B5.
function B5_Callback(hObject, eventdata, handles)
% hObject    handle to B5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B7.
function B7_Callback(hObject, eventdata, handles)
% hObject    handle to B7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B12.
function B12_Callback(hObject, eventdata, handles)
% hObject    handle to B12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B17.
function B17_Callback(hObject, eventdata, handles)
% hObject    handle to B17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B22.
function B22_Callback(hObject, eventdata, handles)
% hObject    handle to B22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B8.
function B8_Callback(hObject, eventdata, handles)
% hObject    handle to B8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B13.
function B13_Callback(hObject, eventdata, handles)
% hObject    handle to B13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B18.
function B18_Callback(hObject, eventdata, handles)
% hObject    handle to B18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B23.
function B23_Callback(hObject, eventdata, handles)
% hObject    handle to B23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B9.
function B9_Callback(hObject, eventdata, handles)
% hObject    handle to B9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B14.
function B14_Callback(hObject, eventdata, handles)
% hObject    handle to B14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B19.
function B19_Callback(hObject, eventdata, handles)
% hObject    handle to B19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B24.
function B24_Callback(hObject, eventdata, handles)
% hObject    handle to B24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B10.
function B10_Callback(hObject, eventdata, handles)
% hObject    handle to B10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B15.
function B15_Callback(hObject, eventdata, handles)
% hObject    handle to B15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B20.
function B20_Callback(hObject, eventdata, handles)
% hObject    handle to B20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B25.
function B25_Callback(hObject, eventdata, handles)
% hObject    handle to B25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exit= questdlg('您要結束本應用程式?','離開','是','否','否');
if exit == '是'
   close(gcf) 
end


% --- Executes on button press in Restart.
function Restart_Callback(hObject, eventdata, handles)
% hObject    handle to Restart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Restart,'visible','Off');
set(handles.Start,'visible','On');
set(handles.Begin,'visible','On');
set(handles.Wrong,'visible','Off');
set(handles.creep,'visible','Off');
set(handles.Correct,'visible','Off');
x = [7,28.4,49.8,71.2,92.6];
y = [33.5,25.5,17.5,9.5,1.5];
for i = 1:5
    for j = 1:5 
        set(handles.(sprintf('B%d',5*(i-1)+j)),'visible','On','Position',[x(j) y(i) 18.1 6.9]);
    end
end


% --- Executes during object deletion, before destroying properties.
function Correct_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to Correct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in creep.
function creep_Callback(hObject, eventdata, handles)
% hObject    handle to creep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in Next.
function Next_Callback(hObject, eventdata, handles)
% hObject    handle to Next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Next.
function Next_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
