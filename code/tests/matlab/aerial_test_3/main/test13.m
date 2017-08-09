%% Car Detector
% Load the positive samples data from a MAT file. The file contains
% a table specifying bounding boxes for several object categories.
% The table was exported from the Training Image Labeler app.
%% Load image folders

%negatives
global negativeImages;

negativeFolder_nocar = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\car_negative_images\';
negativeImages = imageDatastore(negativeFolder_nocar);%

%positives
global positiveInstances_sedan_top_close;
positiveInstances_sedan_top_close = sedan_top_close(:,1:2);

%% menu

TrainingType = txtmenu('Choose CAR training type (distance)','Close','Medium','Far');
%fprintf(1, 'Training selected %i\n', TrainingType);%debug

if TrainingType == 0
    
    Car_Sedan_Top_Close_Training();
    
end



%%
% Select the bounding boxes for stop signs from the table.
%positiveInstances_top = far(:,1:2);

%positiveInstances_top = front(:,1:2);

%%
% Specify the foler for negative images.
negativeFolder_nocar = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\car_negative_images\';
%% test  images
TestImagesFolder = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\';
addpath(TestImagesFolder);
ImagesFilePattern = fullfile(TestImagesFolder,'*.jpg'); 
ImagesList = dir(ImagesFilePattern);

 

%for debug
%disp('\nTest Images List:');
%{
for k = 1:length(ImagesList)
  baseFileName = ImagesList(k).name;
  fullFileName = fullfile(TestImagesFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  imshow(imageArray);  
  drawnow;
end 
%}
  


%%
% Create an |imageDatastore| object containing negative images.
%negativeImages_sedan = imageDatastore({negativeFolder_nocar, ...
 %   'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\suv_top_view.png',...
  %  'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\pickup_top_view.png',...
   % 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\van_top_view.png',...
    %'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\car_hatchback_top_view.png'});%

negativeImages = imageDatastore(negativeFolder_nocar);%
%%
% Train a cascade object detector called 'stopSignDetector.xml'
% using HOG features.
% NOTE: The command can take several minutes to run.

%trainCascadeObjectDetector('far.xml',positiveInstances_top, ...
 %   negativeImages,'FalseAlarmRate',0.15,'NumCascadeStages',11); %



%%
% Use the newly trained classifier to detect a stop sign in an image.
%detector_car = vision.CascadeObjectDetector('far.xml'); % top
%detector_car = vision.CascadeObjectDetector('close.xml'); % top



%%

rmpath(TestImagesFolder); % Remove the image directory from the path.


%% Function definition

%function to train Car Sedan Top Close detector
function o = Car_Sedan_Top_Close_Training()

    global positiveInstances_sedan_top_close;
    global negativeImages;

    load('..\labelling\vehicles\sedan_top_close.mat'); %load labelling session    
    trainCascadeObjectDetector('sedan_top_close.xml',positiveInstances_sedan_top_close, ... %training call
        negativeImages,'FalseAlarmRate',0.15,'NumCascadeStages',11); %
    
end
%eof

%function to train Car Sedan Top Medium detector
function o = Car_Sedan_Top_Medium_Training()

    global positiveInstances_sedan_top_medium;
    global negativeImages;

    load('..\labelling\vehicles\sedan_top_close.mat'); %load labelling session    
    trainCascadeObjectDetector('sedan_top_close.xml',positiveInstances_sedan_top_close, ... %training call
        negativeImages,'FalseAlarmRate',0.15,'NumCascadeStages',11); %
    
end
%eof

