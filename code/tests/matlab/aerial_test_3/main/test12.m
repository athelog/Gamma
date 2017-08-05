%% Car Detector
% Load the positive samples data from a MAT file. The file contains
% a table specifying bounding boxes for several object categories.
% The table was exported from the Training Image Labeler app.
%% Load car positive samples, labelling session.

% Sedan top 
load('far_top_labelingSession.mat');



%%
% Select the bounding boxes for stop signs from the table.
positiveInstances_front = top(:,1:2);

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

 %trainCascadeObjectDetector('Front_Top_Top.xml',positiveInstances_front, ...
    %negativeImages,'FalseAlarmRate',0.15,'NumCascadeStages',5); %works

%trainCascadeObjectDetector('Front_Top_Top.xml',positiveInstances_front, ...
%    negativeImages,'FalseAlarmRate',0.15,'NumCascadeStages',8); %


%%
% Use the newly trained classifier to detect a stop sign in an image.
detector_car = vision.CascadeObjectDetector('Front_Top_Top.xml'); % top

%% main flow


for k = 1:length(ImagesList)
	baseFileName = ImagesList(k).name;
	fullFileName = fullfile(TestImagesFolder, baseFileName);
	fprintf(1, 'Now reading %s\n', baseFileName);
  
    img_car = img;  
    bbox_car = step(detector_car,img_car);
    detectedImg_car = insertObjectAnnotation(img_car,'rectangle',bbox_car,'car');

end
%end of main loop

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%former flow %%%%%%%%%%%%

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