%% Train Stop Sign Detector
% Load the positive samples data from a MAT file. The file contains
% a table specifying bounding boxes for several object categories.
% The table was exported from the Training Image Labeler app.
%%
% Load positive samples, labelling session.
load('hb_top_labelingSession_1.mat');
load('sedan_top_labelingSession_1.mat');
load('van_top_labelingSession_1.mat');
load('suv_top_labelingSession_1.mat');
%%
% Select the bounding boxes for stop signs from the table.
%positiveInstances = test(:,1:2);
positiveInstances_hb = hb(:,1:2);
positiveInstances_sedan = sedan(:,1:2);
positiveInstances_van = van(:,1:2);
positiveInstances_suv = suv(:,1:2);
%%
% Add the image directory to the MATLAB path.
imDir = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures';    
addpath(imDir);
%%
% Specify the foler for negative images.
negativeFolder = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\car_negative_images\';
negativeFolder_nocar = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\car_negative_images\';
%%
% Create an |imageDatastore| object containing negative images.
negativeImages = imageDatastore(negativeFolder);%org

negativeImages_hb = imageDatastore({negativeFolder_nocar, ...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\car_sedan_top_view.png',...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\pickup_top_view.png',...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\suv_top_view.png',...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\van_top_view.png'});%

negativeImages_van = imageDatastore({negativeFolder_nocar, ...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\car_sedan_top_view.png',...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\pickup_top_view.png',...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\suv_top_view.png',...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\car_hatchback_top_view.png'});%

negativeImages_suv = imageDatastore({negativeFolder_nocar, ...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\car_sedan_top_view.png',...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\pickup_top_view.png',...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\van_top_view.png',...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\car_hatchback_top_view.png'});%

negativeImages_sedan = imageDatastore({negativeFolder_nocar, ...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\suv_top_view.png',...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\pickup_top_view.png',...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\van_top_view.png',...
    'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\car_hatchback_top_view.png'});%
%%
% Train a cascade object detector called 'stopSignDetector.xml'
% using HOG features.
% NOTE: The command can take several minutes to run.


 trainCascadeObjectDetector('SedanTopView.xml',positiveInstances_sedan, ...
    negativeImages_sedan,'FalseAlarmRate',0.1,'NumCascadeStages',8);

 trainCascadeObjectDetector('HatchbackTopView.xml',positiveInstances_hb, ...
    negativeImages_hb,'FalseAlarmRate',0.1,'NumCascadeStages',8);

 trainCascadeObjectDetector('VanTopView.xml',positiveInstances_van, ...
    negativeImages_van,'FalseAlarmRate',0.1,'NumCascadeStages',8);

 trainCascadeObjectDetector('SuvTopView.xml',positiveInstances_suv, ...
    negativeImages_suv,'FalseAlarmRate',0.1,'NumCascadeStages',8);
  
%%
% Use the newly trained classifier to detect a stop sign in an image.
detector_sedan = vision.CascadeObjectDetector('SedanTopView.xml'); %sedan top
detector_hb = vision.CascadeObjectDetector('HatchbackTopView.xml'); %hatback top
detector_van = vision.CascadeObjectDetector('VanTopView.xml'); %hatback top
detector_suv = vision.CascadeObjectDetector('SuvTopView.xml'); %suv top

%%
% Read the test image.
%img = imread('car_top_view_2.jpg');
%img = imread('car_top_view_4.jpg');
%img = imread('car_top_view_5.jpg');
%img = imread('car_top_view_6.jpg');
%img = imread('car_top_view_7.jpg');
%img = imread('car_top_view_8.jpg');
%img = imread('car_top_view_9.jpg');
%img = imread('car_top_view_10.jpg');
%img = imread('car_top_view_11.jpg');
%img = imread('car_top_view_14.jpg'); %

%training images
%img = imread('E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\car_top_view_model_1.png');
%img = imread('E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\car_sedan_top_view.png'); %training image
%img = imread('E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\car_hatchback_top_view.png');
img = imread('E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\top_without_background\van_top_view.png');




%%

img_sedan = img;
img_hb = img;
img_van = img;
img_suv = img;

% Detect a stop sign.
bbox_sedan = step(detector_sedan,img_sedan);
bbox_hb = step(detector_hb,img_hb);
bbox_van = step(detector_van,img_van);
bbox_suv = step(detector_suv,img_suv);

%%
% Insert bounding box rectangles and return the marked image.
 detectedImg_sedan = insertObjectAnnotation(img_sedan,'rectangle',bbox_sedan,'sedan');
 detectedImg_hb = insertObjectAnnotation(img_hb,'rectangle',bbox_hb,'hb');
 detectedImg_van = insertObjectAnnotation(img_van,'rectangle',bbox_van,'van');
 detectedImg_suv = insertObjectAnnotation(img_suv,'rectangle',bbox_suv,'suv');
%%
% Display the detected stop sign.
figure; 

%imshow(detectedImg_sedan);
%imshow(detectedImg_hb);
imshow(detectedImg_van);
%imshow(detectedImg_suv);
%%
% Remove the image directory from the path.
rmpath(imDir); 