function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 09-Nov-2015 00:09:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function input_prime_Callback(hObject, eventdata, handles)
% hObject    handle to input_prime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of input_prime as text
%        str2double(get(hObject,'String')) returns contents of input_prime as a double
handles.input_prime = get(hObject,'String');


% --- Executes during object creation, after setting all properties.
function input_prime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_prime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in check_button.
function check_button_Callback(hObject, eventdata, handles)
% hObject    handle to check_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

number = str2double(get(handles.input_prime,'String'));
for i1 = 2:(floor(sqrt(number)))
    numb = mod(number,i1);
        if (numb == 0)
            result = 'Not a prime';
            break;
        else
            result = 'Prime!';
        end
end

set(handles.output_check,'String',result);



function input_prime2_Callback(hObject, eventdata, handles)
% hObject    handle to input_prime2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_prime2 as text
%        str2double(get(hObject,'String')) returns contents of input_prime2 as a double
handles.input_prime2 = get(hObject,'String');


% --- Executes during object creation, after setting all properties.
function input_prime2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_prime2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in check_button2.
function check_button2_Callback(hObject, eventdata, handles)
% hObject    handle to check_button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number1 = str2double(get(handles.input_prime,'String'));
number2 = str2double(get(handles.input_prime2,'String'));
for i2 = 2:(floor(sqrt(number2)))
    numb2 = mod(number2,i2);
    if (numb2 == 0)
        result2 = 'Not a prime';
        primeout = result2;
        break;
    else
        result2 = 'Prime!';
        sigh = (number1-1)*(number2-1);
        checker = get(handles.output_check,'String');
        if (strcmp('Prime!',checker))
            primeout = sprintf('The totient function gives us %d',sigh);
            set(handles.output_primes,'String',primeout); 
        else
            primeout = 'Cant find result when prime1 is not prime!';
            set(handles.output_primes,'String',primeout);
        end
    end
end

set(handles.output_check2,'String',result2);
set(handles.output_primes,'String',primeout);