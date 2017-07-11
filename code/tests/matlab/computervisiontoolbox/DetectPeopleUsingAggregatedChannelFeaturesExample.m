%% Detect People Using Aggregated Channel Features

%%
% Load the upright people detector.
detector = peopleDetectorACF;
%%
% Read an image. Detect people in the image.
%I = imread('visionteam1.jpg');
I = imread('C:\Users\RVQ\Pictures\people3.jpg');

[bboxes,scores] = detect(detector,I);
%%
% Annotate detected people with bounding boxes and their detection scores.
I = insertObjectAnnotation(I,'rectangle',bboxes,scores);
figure
imshow(I)
title('Detected People and Detection Scores')