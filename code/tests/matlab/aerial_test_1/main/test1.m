%%

%%
addpath('E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\matlab\aerial_test_1\common\');

%% Init

close all; clear all; clc






%objective globals


Type = "NONE";

%% main loop

Main();

%%
%HTTP_Send('http://localhost/gamma/engine/dBInterface.php?ActionDBToken=InsertDetectionRecord&Type=car2');

%% Mainflow

function o = Main()

    count = 0;
    
    figure('doublebuffer','on', ...
       'CurrentCharacter','a', ...
       'WindowStyle','modal');
   
    t=text(.5,.5,datestr(now),'Hor','center');
    mTextBox = uicontrol('style','text');
    
    %execution loop
    while double(get(gcf,'CurrentCharacter'))~=27

        set(t,'String',datestr(now));

        count=count+1;
        pause(1);

        %random location    
        X_Y_String = GenerateRandomLocationString();    

        set(mTextBox,'String',X_Y_String);

    end

    set(t,'String','Finished');
    set(gcf,'WindowStyle','normal');
    
    


end
%end of main function

%%