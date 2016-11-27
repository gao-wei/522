function varargout = testmodel(varargin)
% TESTMODEL MATLAB code for testmodel.fig
%      TESTMODEL, by itself, creates a new TESTMODEL or raises the existing
%      singleton*.
%
%      H = TESTMODEL returns the handle to a new TESTMODEL or the handle to
%      the existing singleton*.
%
%      TESTMODEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTMODEL.M with the given input arguments.
%
%      TESTMODEL('Property','Value',...) creates a new TESTMODEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before testmodel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to testmodel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help testmodel

% Last Modified by GUIDE v2.5 25-Nov-2016 13:00:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @testmodel_OpeningFcn, ...
                   'gui_OutputFcn',  @testmodel_OutputFcn, ...
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


% --- Executes just before testmodel is made visible.
function testmodel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to testmodel (see VARARGIN)

 

% Choose default command line output for testmodel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes testmodel wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%global axes1_h;
%axes1_h = handles.axes1;
%global axes2_h; 
%axes2_h = handles.axes2;



% --- Outputs from this function are returned to the command line.
function varargout = testmodel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in decisiontreebutton.
function decisiontreebutton_Callback(hObject, eventdata, handles)
% hObject    handle to decisiontreebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

month = str2double(handles.selectedMonth);
year = str2double(handles.selectedYear);

%tbl = xlsread('testset_result.xlsx');
 tbl = xlsread('testset_result_noyear.xlsx');
% a = [0,2,4,6,8,10,12,14,16];
% b = [0,2,4,6,8,10,12,14,16,18];

h = size(tbl,1);
n1 = 0;
n2 = 0;
start = 0;
k=1;

while k <= h
    if(tbl(k,3)==year)&&(tbl(k,4)==month)
        start = k;
        break
    end
    k=k+1
end

cla
legend(handles.axes2,'hide');
%Original Data
axes(handles.axes1); 
cla(handles.axes1,'reset')

grid on
xlim([0 16])
ylim([0 17])

xlabel('Longitude: -125.625 (x=1) to -116.250 (x=16)') % x-axis label
ylabel('Latitude: 42.14206 (y=1) to 49.76094 (y=17)') % y-axis label

n1=start;
for i=2:15
    for j = 0:14
        r=rectangle('Position',[i,14-j,1,1])
        r.EdgeColor = [1 1 1]
        
    if (tbl(n1,3)==year)&&(tbl(n1,4)==month)&&(n1<=h) 
        if(tbl(n1,5)==1)
            r.FaceColor = [1 0 0]
        elseif(tbl(n1,5)==2)
            r.FaceColor = [1 0.4 0]
        elseif(tbl(n1,5)==3)
            r.FaceColor = [1 0.8 0]
        elseif(tbl(n1,5)==4)
            r.FaceColor = [0.5 0.8 0.5]
        elseif(tbl(n1,5)==5)
            r.FaceColor = [0.5 0.8 1]
        elseif(tbl(n1,5)==6)
            r.FaceColor = [0 0.6 1]
        else
            r.FaceColor = [0 0 1]
        end
        
    end
    n1= n1+1
    end
end

for i = 2:4
    for j = 13:14
    r1=rectangle('Position',[i,j,1,1]);
    r1.FaceColor = [1 1 1]
    r1.EdgeColor = [1 1 1]
    end
end
%  
%  
for j = 3:11
    r2=rectangle('Position',[2,j,1,1]);
    r2.FaceColor = [1 1 1]
    r2.EdgeColor = [1 1 1]
end
%  
    r3=rectangle('Position',[2,0,1,1]);
    r3.FaceColor = [1 1 1]
    r3.EdgeColor = [1 1 1]
%     
    r4=rectangle('Position',[15,0,1,1]);
    r4.FaceColor = [1 1 1]
    r4.EdgeColor = [1 1 1]

%Prediction Data
axes(handles.axes2); 
cla(handles.axes2,'reset')
grid on
xlim([0 16])
ylim([0 17])   
xlabel('Longitude: -125.625 (x=1) to -116.250 (x=16)') % x-axis label
ylabel('Latitude: 42.14206 (y=1) to 49.76094 (y=17)') % y-axis label

n2=start;
for i=2:15
    for j = 0:14
        r=rectangle('Position',[i,14-j,1,1])
        r.EdgeColor = [1 1 1]
        
    if (tbl(n2,3)==year)&&(tbl(n2,4)==month)&&(n2<=h) 
        if(tbl(n2,6)==1)
            r.FaceColor = [1 0 0]
        elseif(tbl(n2,6)==2)
            r.FaceColor = [1 0.4 0]
        elseif(tbl(n2,6)==3)
            r.FaceColor = [1 0.8 0]
        elseif(tbl(n2,6)==4)
            r.FaceColor = [0.5 0.8 0.5]
        elseif(tbl(n2,6)==5)
            r.FaceColor = [0.5 0.8 1]
        elseif(tbl(n2,6)==6)
            r.FaceColor = [0 0.6 1]
        else
            r.FaceColor = [0 0 1]
        end
        
    end
    n2= n2+1
    end
end

for i = 2:4
    for j = 13:14
    r1=rectangle('Position',[i,j,1,1]);
    r1.FaceColor = [1 1 1]
    r1.EdgeColor = [1 1 1]
    end
end
%  
%  
for j = 3:11
    r2=rectangle('Position',[2,j,1,1]);
    r2.FaceColor = [1 1 1]
    r2.EdgeColor = [1 1 1]
end
%  
    r3=rectangle('Position',[2,0,1,1]);
    r3.FaceColor = [1 1 1]
    r3.EdgeColor = [1 1 1]
%     
    r4=rectangle('Position',[15,0,1,1]);
    r4.FaceColor = [1 1 1]
    r4.EdgeColor = [1 1 1]
    
axes(handles.axes3); %legend
xlim([0 7])
ylim([0 1]) 

set(handles.axes3,'xtick',[],'ytick',[]);
for i = 0:6
        r=rectangle('Position',[i,0,1,1])
        r.EdgeColor = [1 1 1]
        
        if(i==0)
            r.FaceColor = [1 0 0]
        elseif(i==1)
            r.FaceColor = [1 0.4 0]
        elseif(i==2)
            r.FaceColor = [1 0.8 0]
        elseif(i==3)
            r.FaceColor = [0.5 0.8 0.5]
        elseif(i==4)
            r.FaceColor = [0.5 0.8 1]
        elseif(i==5)
            r.FaceColor = [0 0.6 1]
        else
            r.FaceColor = [0 0 1]
        end
end
    
% %disp(month);
% %disp(year);
% disp(start);

% --- Executes on button press in decisionbutton.

% --- Executes on button press in KNNbutton.
function KNNbutton_Callback(hObject, eventdata, handles)
% hObject    handle to KNNbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

month = str2double(handles.selectedMonth);
year = str2double(handles.selectedYear);

%tbl = xlsread('KNNtest_result_year.xlsx');
tbl = xlsread('KNNtest_result_noyear.xlsx');

h = size(tbl,1);
n1 = 0;
n2 = 0;
start = 0;
k=1;

while k <= h
    if(tbl(k,3)==year)&&(tbl(k,4)==month)
        start = k;
        break
    end
    k=k+1
end

cla
legend(handles.axes2,'hide');
%Original Data
axes(handles.axes1); 
cla(handles.axes1,'reset')
grid on
xlim([0 16])
ylim([0 17])
xlabel('Longitude: -125.625 (x=1) to -116.250 (x=16)') % x-axis label
ylabel('Latitude: 42.14206 (y=1) to 49.76094 (y=17)') % y-axis label

n1=start;
for i=2:15
    for j = 0:14
        r=rectangle('Position',[i,14-j,1,1])
        r.EdgeColor = [1 1 1]
        
    if (tbl(n1,3)==year)&&(tbl(n1,4)==month)&&(n1<=h) 
        if(tbl(n1,5)==1)
            r.FaceColor = [1 0 0]
        elseif(tbl(n1,5)==2)
            r.FaceColor = [1 0.4 0]
        elseif(tbl(n1,5)==3)
            r.FaceColor = [1 0.8 0]
        elseif(tbl(n1,5)==4)
            r.FaceColor = [0.5 0.8 0.5]
        elseif(tbl(n1,5)==5)
            r.FaceColor = [0.5 0.8 1]
        elseif(tbl(n1,5)==6)
            r.FaceColor = [0 0.6 1]
        else
            r.FaceColor = [0 0 1]
        end
        
    end
    n1= n1+1
    end
end

for i = 2:4
    for j = 13:14
    r1=rectangle('Position',[i,j,1,1]);
    r1.FaceColor = [1 1 1]
    r1.EdgeColor = [1 1 1]
    end
end
%  
%  
for j = 3:11
    r2=rectangle('Position',[2,j,1,1]);
    r2.FaceColor = [1 1 1]
    r2.EdgeColor = [1 1 1]
end
%  
    r3=rectangle('Position',[2,0,1,1]);
    r3.FaceColor = [1 1 1]
    r3.EdgeColor = [1 1 1]
%     
    r4=rectangle('Position',[15,0,1,1]);
    r4.FaceColor = [1 1 1]
    r4.EdgeColor = [1 1 1]

%Prediction Data
axes(handles.axes2); 
cla(handles.axes2,'reset')
grid on
xlim([0 16])
ylim([0 17]) 
xlabel('Longitude: -125.625 (x=1) to -116.250 (x=16)') % x-axis label
ylabel('Latitude: 42.14206 (y=1) to 49.76094 (y=17)') % y-axis label

n2=start;
for i=2:15
    for j = 0:14
        r=rectangle('Position',[i,14-j,1,1])
        r.EdgeColor = [1 1 1]
        
    if (tbl(n2,3)==year)&&(tbl(n2,4)==month)&&(n2<=h) %1956, Jan
        if(tbl(n2,7)==1)
            r.FaceColor = [1 0 0]
        elseif(tbl(n2,7)==2)
            r.FaceColor = [1 0.4 0]
        elseif(tbl(n2,7)==3)
            r.FaceColor = [1 0.8 0]
        elseif(tbl(n2,7)==4)
            r.FaceColor = [0.5 0.8 0.5]
        elseif(tbl(n2,7)==5)
            r.FaceColor = [0.5 0.8 1]
        elseif(tbl(n2,7)==6)
            r.FaceColor = [0 0.6 1]
        else
            r.FaceColor = [0 0 1]
        end
        
    end
    n2= n2+1
    end
end

for i = 2:4
    for j = 13:14
    r1=rectangle('Position',[i,j,1,1]);
    r1.FaceColor = [1 1 1]
    r1.EdgeColor = [1 1 1]
    end
end
%  
%  
for j = 3:11
    r2=rectangle('Position',[2,j,1,1]);
    r2.FaceColor = [1 1 1]
    r2.EdgeColor = [1 1 1]
end
%  
    r3=rectangle('Position',[2,0,1,1]);
    r3.FaceColor = [1 1 1]
    r3.EdgeColor = [1 1 1]
%     
    r4=rectangle('Position',[15,0,1,1]);
    r4.FaceColor = [1 1 1]
    r4.EdgeColor = [1 1 1]
    
axes(handles.axes3); %legend
xlim([0 7])
ylim([0 1]) 
set(handles.axes3,'xtick',[],'ytick',[]);
for i = 0:6
        r=rectangle('Position',[i,0,1,1])
        r.EdgeColor = [1 1 1]
        
        if(i==0)
            r.FaceColor = [1 0 0]
        elseif(i==1)
            r.FaceColor = [1 0.4 0]
        elseif(i==2)
            r.FaceColor = [1 0.8 0]
        elseif(i==3)
            r.FaceColor = [0.5 0.8 0.5]
        elseif(i==4)
            r.FaceColor = [0.5 0.8 1]
        elseif(i==5)
            r.FaceColor = [0 0.6 1]
        else
            r.FaceColor = [0 0 1]
        end
end


% --- Executes on selection change in listbox_year.
function listbox_year_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_year contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_year
contents = cellstr(get(hObject,'String'));
handles.selectedYear = contents{get(hObject,'Value')} ;
disp(handles.selectedYear);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function listbox_year_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

contents = cellstr(get(hObject,'String'));
handles.selectedYear = contents{get(hObject,'Value')} ;
disp(handles.selectedYear);
guidata(hObject, handles);



% --- Executes on selection change in listbox_month.
function listbox_month_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_month contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_month

%listboxItems = cellstr(get(hObject, 'String'));
%selectedItems = get(hObject, 'Value');
%handles.selectedMonth = listboxItems{selectedItems};

contents = cellstr(get(hObject,'String'));
handles.selectedMonth = contents{get(hObject,'Value')} ;
disp(handles.selectedMonth);
guidata(hObject, handles);


function listbox_month_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

contents = cellstr(get(hObject,'String'));
handles.selectedMonth = contents{get(hObject,'Value')} ;
disp(handles.selectedMonth);
guidata(hObject, handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

tbl_train = readtable('Training-set-1949-1955.xlsx','Sheet','Sheet1');
tbl_test = readtable('Testing-set-1956-1958.xlsx','Sheet','Sheet1');
amount1=tbl_test.amount;
tbl_test.amount=[];
%tbl = table(amount,lat,lon,month,year,'VariableNames',{'amount','lat','lon','month','year'});
lm = fitlm(tbl_train,'amount~lat+lon+month+year');
%tbl1 = table(lat1,lon1,month1,year1,'VariableNames',{'lat','lon','month','year'});
[ypred,yci] = predict(lm,tbl_test);

axes(handles.axes1);
y=[1:7560]';
plot(y,amount1,'b.');
ylabel('Precipitation (mm)') % y-axis label

set(gca,'XTickMode','manual');
set(gca,'XTick',[1,841,1681,2521,3361,4201,5041,5881,6721,7351]);
set(gca,'XtickLabels',{'(1956)', '5','9','(1957)','5','9','(1958)','5','9','12'});
xlabel('Month') % x-axis label


axes(handles.axes2);
cla(handles.axes2,'reset');
legend(handles.axes2,'show');
plot(y,ypred,'r.');
hold on;
plot(y,amount1,'b.');
legend('Predicted','Actual');
set(gca,'XTickMode','manual');
set(gca,'XTick',[1,841,1681,2521,3361,4201,5041,5881,6721,7351]);
set(gca,'XtickLabels',{'(1956)', '5','9','(1957)','5','9','(1958)','5','9','12'});
xlabel('Month') % x-axis label
ylabel('Precipitation (mm)') % y-axis label

axes(handles.axes3);
cla(handles.axes3,'reset')
set(gca,'xticklabel',{[]}) 
set(gca,'yticklabel',{[]})

% figure(1);
% y=[1:7560]';
% plot(y,ypred,'r.');
% hold on;
% plot(y,amount1,'b.');
% xlabel('Month') % x-axis label
% ylabel('Precipitation (mm)') % y-axis label


% --- Executes on button press in LR2_button.
function LR2_button_Callback(hObject, eventdata, handles)
% hObject    handle to LR2_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


tbl_test = readtable('Testing-set-1956-1958.xlsx','Sheet','Sheet1');
tbl_pred = readtable('lrpredPos.xlsx','Sheet','Sheet1');
amount1=tbl_test.amount;
pred= tbl_pred.amount;

axes(handles.axes1);
y=[1:7560]';
plot(y,amount1,'b.');
ylabel('Precipitation (mm)') % y-axis label

set(gca,'XTickMode','manual');
set(gca,'XTick',[1,841,1681,2521,3361,4201,5041,5881,6721,7351]);
set(gca,'XtickLabels',{'(1956)', '5','9','(1957)','5','9','(1958)','5','9','12'});
xlabel('Month') % x-axis label

axes(handles.axes2);
cla(handles.axes2,'reset');
legend(handles.axes2,'show');
plot(y,pred,'r.');
hold on;
plot(y,amount1,'b.');
legend('Predicted','Actual');
set(gca,'XTickMode','manual');
set(gca,'XTick',[1,841,1681,2521,3361,4201,5041,5881,6721,7351]);
set(gca,'XtickLabels',{'(1956)', '5','9','(1957)','5','9','(1958)','5','9','12'});
xlabel('Month') % x-axis label
ylabel('Precipitation (mm)') % y-axis label

axes(handles.axes3);
cla(handles.axes3,'reset')
set(gca,'xticklabel',{[]}) 
set(gca,'yticklabel',{[]}) 
