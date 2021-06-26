function varargout = Rumah_saw(varargin)
% RUMAH_SAW MATLAB code for Rumah_saw.fig
%      RUMAH_SAW, by itself, creates a new RUMAH_SAW or raises the existing
%      singleton*.
%
%      H = RUMAH_SAW returns the handle to a new RUMAH_SAW or the handle to
%      the existing singleton*.
%
%      RUMAH_SAW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUMAH_SAW.M with the given input arguments.
%
%      RUMAH_SAW('Property','Value',...) creates a new RUMAH_SAW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Rumah_saw_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Rumah_saw_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Rumah_saw

% Last Modified by GUIDE v2.5 26-Jun-2021 12:37:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Rumah_saw_OpeningFcn, ...
                   'gui_OutputFcn',  @Rumah_saw_OutputFcn, ...
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


% --- Executes just before Rumah_saw is made visible.
function Rumah_saw_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Rumah_saw (see VARARGIN)

% Choose default command line output for Rumah_saw
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Rumah_saw wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Rumah_saw_OutputFcn(hObject, eventdata, handles) 
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
data1 = xlsread('RUMAH.xlsx','C2:H21');
set(handles.data1,'data',data1);          


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
w = [0.3,0.2,0.23,0.1,0.07,0.1];
k = [0,1,1,1,1,1];
x = xlsread('RUMAH.xlsx','C2:H21');

[m,n]=size (x); 
R=zeros (m,n); 
Y=zeros (m,n);
for j=1:n
    if k(j)==1
        R(:,j)=x(:,j)./max(x(:,j));
    else
        R(:,j)=min(x(:,j))./x(:,j);
    end
end

for i=1:m
    V(i)= sum(w.*R(i,:));
end

peringkat = sort(V, 'descend');
set(handles.hasil, 'data', peringkat); 

