%% Train Stop Sign Detector
% Load the positive samples data from a MAT file. The file contains
% a table specifying bounding boxes for several object categories.
% The table was exported from the Training Image Labeler app.
%%
% Load positive samples.
%load('stopSignsAndCars.mat'); %former
load('PplTopLabelingSession.mat');
%%
% Select the bounding boxes for stop signs from the table.
%positiveInstances = stopSignsAndCars(:,1:2);
positiveInstances = PeopleTopView(:,1:2);
%%
% Add the image directory to the MATLAB path.
%imDir = fullfile(matlabroot,'toolbox','vision','visiondata',...
    %'stopSignImages');%former
imDir = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\';    
addpath(imDir);
%%
% Specify the foler for negative images.
%negativeFolder = fullfile(matlabroot,'toolbox','vision','visiondata',...
   % 'nonStopSigns'); %former
negativeFolder = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\nonPeopleTop\';    
%%
% Create an |imageDatastore| object containing negative images.
negativeImages = imageDatastore(negativeFolder);
%%
% Train a cascade object detector called 'stopSignDetector.xml'
% using HOG features.
% NOTE: The command can take several minutes to run.
%trainCascadeObjectDetector('stopSignDetector.xml',positiveInstances, ...
 %   negativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',5); %former
 
 trainCascadeObjectDetector('PeopleToView.xml',positiveInstances, ...
    negativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',10);
 
%%
% Use the newly trained classifier to detect a stop sign in an image.
%detector = vision.CascadeObjectDetector('stopSignDetector.xml'); %former
detector = vision.CascadeObjectDetector('PeopleToView.xml');
%%
% Read the test image.
%img = imread('stopSignTest.jpg');%former
%img = imread('people_top_view_9.jpg'); %good result
img = imread('people_top_view_7.jpg');
%%
% Detect a stop sign.
bbox = step(detector,img); 
%%
% Insert bounding box rectangles and return the marked image.
 detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'Person');
%%
% Display the detected stop sign.
figure; imshow(detectedImg);
%%
% Remove the image directory from the path.
rmpath(imDir); 