%% Car Detector
% Load the positive samples data from a MAT file. The file contains
% a table specifying bounding boxes for several object categories.
% The table was exported from the Training Image Labeler app.

%% load test  images

global TestImagesFolder;
TestImagesFolder = 'E:\BUSSINESS\Athelog\Gamma\Gamma\code\tests\media\car_pictures\';

addpath(TestImagesFolder);
ImagesFilePattern = fullfile(TestImagesFolder,'*.jpg'); 

global ImagesList;
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

%%  prompt menu

DetectorType = txtmenu('Choose CAR training type (distance)','Close','Medium','Far','Close(All cars)');
%fprintf(1, 'Training selected %i\n', TrainingType);%debug

if DetectorType == 0    
    Car_Sedan_Top_Close_Detection();
    
elseif DetectorType == 1  
    Car_Sedan_Top_Medium_Detection();

elseif DetectorType == 3  
    Car_All_Top_Close_Detection();
end

%%

rmpath(TestImagesFolder); % Remove the image directory from the path.

%% Function definition

% function to detect sedan top close 
function o = Car_Sedan_Top_Close_Detection()

    global TestImagesFolder;
    global ImagesList;
    
    detector_car = vision.CascadeObjectDetector('sedan_top_close.xml');

    for k = 1:length(ImagesList)
        baseFileName = ImagesList(k).name;
        fullFileName = fullfile(TestImagesFolder, baseFileName);
        fprintf(1, 'Now reading %s\n', baseFileName);

        img_car = imread(fullFileName);  
        bbox_car = step(detector_car,img_car);
        detectedImg_car = insertObjectAnnotation(img_car,'rectangle',bbox_car,'car');
        figure; 
        imshow(detectedImg_car);
    end
    
end

% function to detect sedan top medium 
function o = Car_Sedan_Top_Medium_Detection()

    global TestImagesFolder;
    global ImagesList;
    
    detector_car = vision.CascadeObjectDetector('sedan_top_medium.xml');

    for k = 1:length(ImagesList)
        baseFileName = ImagesList(k).name;
        fullFileName = fullfile(TestImagesFolder, baseFileName);
        fprintf(1, 'Now reading %s\n', baseFileName);

        img_car = imread(fullFileName);  
        bbox_car = step(detector_car,img_car);
        detectedImg_car = insertObjectAnnotation(img_car,'rectangle',bbox_car,'top');
        figure; 
        imshow(detectedImg_car);
    end
    
end

% function to detect all top close 
function o = Car_All_Top_Close_Detection()

    global TestImagesFolder;
    global ImagesList;
    
    detector_car = vision.CascadeObjectDetector('all_top_close.xml');

    for k = 1:length(ImagesList)
        baseFileName = ImagesList(k).name;
        fullFileName = fullfile(TestImagesFolder, baseFileName);
        fprintf(1, 'Now reading %s\n', baseFileName);

        img_car = imread(fullFileName);  
        bbox_car = step(detector_car,img_car);
        detectedImg_car = insertObjectAnnotation(img_car,'rectangle',bbox_car,'top');
        figure; 
        imshow(detectedImg_car);
    end
    
end