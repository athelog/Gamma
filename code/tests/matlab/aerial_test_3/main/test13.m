%% Car Detector
% Load the positive samples data from a MAT file. The file contains
% a table specifying bounding boxes for several object categories.
% The table was exported from the Training Image Labeler app.
%% Load car positive samples, labelling session.

% Sedan top 
load('far_top_labelingSession.mat');


%suv/truck
load('truck_front_close_top_labelingSession.mat');

%% menu

TrainingType = txtmenu('Choose training type (distance)','Close','Medium','Far');

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

%function
function o = Car_Close_Training()

    load('close_top_labelingSession.mat'); %load labelling session
    positiveInstances_top = close(:,1:2);
    
    trainCascadeObjectDetector('close.xml',positiveInstances_top, ... %training call
        negativeImages,'FalseAlarmRate',0.15,'NumCascadeStages',11); %
    
end
%eof

