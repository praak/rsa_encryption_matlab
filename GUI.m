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

% Last Modified by GUIDE v2.5 11-Nov-2015 16:17:56

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

rng('shuffle')
global max
global min
min = 2^32;
max = 2^52;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% set(handles.encrypt,'visible','off')

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
global min
global max
%number = str2double(get(handles.input_prime,'String'));
number = randi([min max],1);
while (~(isprime(number)))
    pause(0.01)
   number = randi([min max],1);
end
% for i1 = 2:(floor(sqrt(number)))
%     numb = mod(number,i1);
%         if (numb == 0)
%             result = 'Not a prime';
%             break;
%         else
%             result = 'Prime!';
%         end
% end
result = sprintf('%i',number);
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
global min
global max
number2 = randi([min max],1);
while (~(isprime(number2)))
    pause(0.01)
   number2 = randi([min max],1);
end
result2 = sprintf('%i',number2);
set(handles.output_check2,'String',result2);
number2 = sym(get(handles.output_check,'String'));      % making them symbolic
number1 = sym(get(handles.output_check2,'String'));
n = char(number2 * number1);
totient = char((number1-1)*(number2-1));
primeout = sprintf('n = %s, Totient = %s',n,totient);
set(handles.output_primes,'String', primeout);
totient_ot = sprintf('%s',totient);
set(handles.totient_out,'String',totient_ot);


function in_msg_Callback(hObject, eventdata, handles)
% hObject    handle to in_msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of in_msg as text
%        str2double(get(hObject,'String')) returns contents of in_msg as a double
%set(handles.in_msg,'String',''); %clearing the text box. 
set(handles.out_msg,'String',''); %clearing the output text box.
handles.in_msg = get(hObject,'String');

message = get(hObject,'String');
num_message = (double(message)-96);
num_message(num_message<0) = 0;
num_message = sym(num_message);
%translating to decimal
summed = sym(0);
%maxx = length(num_message);
for p = 1:length(num_message)
   temp = num_message(length(num_message)-p+1)*(27^(p-1))
   summed = summed + num_message(length(num_message)-p+1)*(27^(p-1));
%    maxx = maxx - 1;
end
summed = char(summed);
out = sprintf('%s',summed);
set(handles.out_msg,'String',out);


% --- Executes during object creation, after setting all properties.
function in_msg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to in_msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in encrypt.
function encrypt_Callback(hObject, eventdata, handles)
% hObject    handle to encrypt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d = sym(get(handles.the_d,'String'));
m = (sym(get(handles.out_msg,'String')));
one = (sym(get(handles.output_check,'String')));
two = (sym(get(handles.output_check2,'String')));
n = sym(one*two);
% c = 1;
z = modexp(m,d,n);

% for e_prime = 1:d
%     c = (mod((c*m),n));
% end
ptxt = get(handles.in_msg,'String');
set(handles.plain_text,'String',ptxt);
z = char(z);
set(handles.cypher_num,'String',z);


function test_gcd_Callback(hObject, eventdata, handles)
% hObject    handle to test_gcd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of test_gcd as text
%        str2double(get(hObject,'String')) returns contents of test_gcd as a double

number_in = sym(get(handles.test_gcd,'String'));
totient = sym(get(handles.totient_out,'String'));

% TODO : 
%   Need to do the GCD CALL HERE. Need to pull the totient function
%   Need to pull value from user. and check GCD = 1   
if (length(factor(number_in)) == 1)
    if gcd(number_in,totient) == 1
        set(handles.check_in,'String','We good');
    else
        set(handles.test_gcd,'String','');
        set(handles.check_in,'String','Shares a common factor');
    end
else
    set(handles.test_gcd,'String','');
    set(handles.check_in,'String','Not a prime');
end

% --- Executes during object creation, after setting all properties.
function test_gcd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to test_gcd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in find_d.
function find_d_Callback(hObject, eventdata, handles)
% hObject    handle to find_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a1 = (sym(get(handles.totient_out,'String')));
a2 = a1;
b1 = (sym(get(handles.test_gcd,'String')));
b2 = 1;
tot = (sym(get(handles.totient_out,'String')));
d = getd(a1,a2,b1,b2,tot)
d = char(d);
results = sprintf('%s',d);
set(handles.the_d,'String',results);


function [d] = getd(a1,a2,b1,b2,tot)
    %doing extended gcd
    c1 = a1 - b1*(floor(a1/b1));
    c2 = a2 - b2*(floor(a1/b1));
    a1 = b1;
    a2 = b2;
    b1 = c1;
    b2 = c2;
    tot = tot;
    if (b2<0)
        b2 = mod(c2,tot);
    end
    if (b1 == 1)
        d = b2;
        return;
    else
        d = getd(a1,a2,b1,b2,tot);
    end
    


% --- Executes on button press in make_letters.
function make_letters_Callback(hObject, eventdata, handles)
% hObject    handle to make_letters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

c = (sym(get(handles.cypher_num,'String')));
i = 1;
c1 = sym(0);
c2 = sym(0);
while floor(c/27) > 0
    c1(i) = mod(c,27);
    c = floor(c/27);
    i = i + 1;
end
c1(i) = c;

for j = 1:length(c1)
    if (c1(j) == 0)
        c1(j) = 32;
    else
        c1(j) = c1(j)+96;
    end
end

for k = 1: length(c1)
    c2(length(c1)-k+1) = c1(k);
end  
c2 = double(c2);
ctxt = sprintf('%s',c2)
set(handles.c_txt,'String',ctxt);


% --- Executes on button press in decrypt_it.
function decrypt_it_Callback(hObject, eventdata, handles)
% hObject    handle to decrypt_it (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

in_prime = (sym(get(handles.test_gcd,'String')))
c = (sym(get(handles.cypher_num,'String')))
one = (sym(get(handles.output_check,'String')));
two = (sym(get(handles.output_check2,'String')));
n = sym(one*two);
% m = 1;
% for e_prime = 1:in_prime
%     m = mod((m*c),n);
% end
z = modexp(c,in_prime,n);
m=z
z = char(z);
set(handles.num_decrypt,'String',z);
i = 1;
m1 = sym(0);
m2 = sym(0);
while floor(m/27) > 0
    m1(i) = mod(m,27);
    m = floor(m/27);
    i = i + 1;
end

m1(i) = m

for j = 1:length(m1)
    if (m1(j) == 0)
        m1(j) = 32;
    else
        m1(j) = m1(j)+96;
    end
end

for k = 1: length(m1)
    m2(length(m1)-k+1) = m1(k);
end  
m2 = double(m2);
mtxt = sprintf('%s',m2)
set(handles.decryprt_text,'String',mtxt);


function result = modexp(x,y,n)
    if(y == 0)
        result = 1;
        return;
    end
    z = modexp(x,floor(y/2),n);
    if(mod(y,2) == 0)
        result = mod(z*z,n);
        return;
    else
        result = mod(x*z*z,n);
        return;
    end
