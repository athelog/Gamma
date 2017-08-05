%% Car Detector
% Load the positive samples data from a MAT file. The file contains
% a table specifying bounding boxes for several object categories.
% The table was exported from the Training Image Labeler app.
%% Load car positive samples, labelling session.

% Sedan top 
load('front4_top_labelingSession.mat');



%%
% Select the bounding boxes for stop signs from the table.
positiveInstances_front = top3(:,1:2);
%%
% Add the image directory to the MATLAB path.
imDir = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures';    
addpath(imDir);
%%
% Specify the foler for negative images.
negativeFolder_nocar = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\car_negative_images\';
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

 %trainCascadeObjectDetector('Front_Top_Top.xml',positiveInstances_front, ...
    %negativeImages,'FalseAlarmRate',0.15,'NumCascadeStages',5); %works

trainCascadeObjectDetector('Front_Top_Top.xml',positiveInstances_front, ...
    negativeImages,'FalseAlarmRate',0.15,'NumCascadeStages',8); %


%%
% Use the newly trained classifier to detect a stop sign in an image.
detector_front = vision.CascadeObjectDetector('Front_Top_Top.xml'); % top



%%
% Read the test image.
%img = imread('car_top_view_2.jpg');
%img = imread('car_top_view_4.jpg');
img = imread('car_top_view_5.jpg');
%img = imread('car_top_view_6.jpg');
%img = imread('car_top_view_7.jpg');
%img = imread('car_top_view_8.jpg');
%img = imread('car_top_view_9.jpg');
%img = imread('car_top_view_10.jpg');
%img = imread('car_top_view_11.jpg');
%img = imread('car_top_view_12.jpg');
img = imread('car_top_view_13.jpg');
%img = imread('car_top_view_14.jpg'); %

%training images

%img = imread('E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\general_detection\front_top.png');
%img = imread('E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\general_detection\front_top_2.png');
%img = imread('E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\general_detection\front_top_3.png');

%img=imread('E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\sedan_models\sedan_hardroof_top_white_.png');



%%

img_sedan = img;
img_hb = img;
img_van = img;
img_suv = img;
img_front = img;

% Detect a car 
bbox_front = step(detector_front,img_front);

%bbox_sedan = step(detector_sedan,img_sedan);
%bbox_suv = step(detector_suv,img_suv);
%bbox_hb = step(detector_hb,img_hb);
%bbox_van = step(detector_van,img_van);


%%
% Insert bounding box rectangles and return the marked image.
detectedImg_front = insertObjectAnnotation(img_suv,'rectangle',bbox_front,'front');

 %detectedImg_sedan = insertObjectAnnotation(img_sedan,'rectangle',bbox_sedan,'sedan');
 %detectedImg_suv = insertObjectAnnotation(img_suv,'rectangle',bbox_suv,'suv'); 
 %detectedImg_hb = insertObjectAnnotation(img_hb,'rectangle',bbox_hb,'hb');
 %detectedImg_van = insertObjectAnnotation(img_van,'rectangle',bbox_van,'van');
 
%%
% Display the detected stop sign.
figure; 

imshow(detectedImg_front);
%imshow(detectedImg_sedan);
%imshow(detectedImg_suv);
%imshow(detectedImg_hb);
%imshow(detectedImg_van);
%
%%
% Remove the image directory from the path.
rmpath(imDir); 