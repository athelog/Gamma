%% Play a Video File
% Read video from a file and set up player object. 

%%

videoFReader = vision.VideoFileReader('..\media\walk.mp4');
videoPlayer = vision.VideoPlayer;

detector = peopleDetectorACF;
count = 0;
%%
% Play video. Every call to the |step| method reads another frame.

while ~isDone(videoFReader)
   frame = step(videoFReader);
   step(videoPlayer,frame);
   
   I = frame;
   [bboxes,scores] = detect(detector,I);
   I = insertObjectAnnotation(I,'rectangle',bboxes,scores);
	figure
    imshow(I)
    title('Detected People and Detection Scores')
   
end

%%
% Close the file reader and video player.

release(videoFReader);
release(videoPlayer);