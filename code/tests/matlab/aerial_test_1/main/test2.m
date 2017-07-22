%% Train Stop Sign Detector
% Load the positive samples data from a MAT file. The file contains
% a table specifying bounding boxes for several object categories.
% The table was exported from the Training Image Labeler app.
%%
% Load positive samples.
load('car_top_labelling_session_1.mat');
%%
% Select the bounding boxes for stop signs from the table.
positiveInstances = car8(:,1:2);
%%
% Add the image directory to the MATLAB path.
imDir = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures';    
addpath(imDir);
%%
% Specify the foler for negative images.
negativeFolder = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\car_negative_images\';
%%
% Create an |imageDatastore| object containing negative images.
negativeImages = imageDatastore(negativeFolder);
%%
% Train a cascade object detector called 'stopSignDetector.xml'
% using HOG features.
% NOTE: The command can take several minutes to run.

 trainCascadeObjectDetector('CarTopView.xml',positiveInstances, ...
    negativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',3);
%%
% Use the newly trained classifier to detect a stop sign in an image.
detector = vision.CascadeObjectDetector('CarTopView.xml');
%%
% Read the test image.
%img = imread('car_top_view_2.jpg');
%img = imread('car_top_view_5.jpg');
%img = imread('car_top_view_6.jpg');
%img = imread('car_top_view_7.jpg');
%img = imread('car_top_view_8.jpg');
%img = imread('car_top_view_9.jpg');
%img = imread('car_top_view_10.jpg');
%img = imread('car_top_view_11.jpg');
img = imread('car_top_view_12.jpg');
%img = imread('car_top_view_model_1.png'); %training image
%%
% Detect a stop sign.
bbox = step(detector,img); 
%%
% Insert bounding box rectangles and return the marked image.
 detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'stop sign');
%%
% Display the detected stop sign.
figure; imshow(detectedImg);
%%
% Remove the image directory from the path.
rmpath(imDir); 