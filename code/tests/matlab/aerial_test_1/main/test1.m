%%

%%
addpath('E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\matlab\aerial_test_1\common\');

%% Init

close all; clear all; clc

figure('doublebuffer','on', ...
       'CurrentCharacter','a', ...
       'WindowStyle','modal');
mTextBox = uicontrol('style','text');

t=text(.5,.5,datestr(now),'Hor','center');

%objective globals
count = 0;
XPos = -999;
YPos = -999;
Type = "NONE";

%main loop
while double(get(gcf,'CurrentCharacter'))~=27
    
    set(t,'String',datestr(now));
    
    count=count+1;
    pause(1);
    
    %random location
    XPos = randn;
    YPos = randn;
    X_Y_String = strcat(num2str(XPos),",",num2str(YPos));
    
    
    set(mTextBox,'String',X_Y_String);
    
end

set(t,'String','Finished');
set(gcf,'WindowStyle','normal');


%%
%HTTP_Send('http://localhost/gamma/engine/dBInterface.php?ActionDBToken=InsertDetectionRecord&Type=car2');

%% Mainflow

function o = Main()

    %while
    
    


end
%end of main function

%%