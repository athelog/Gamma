%% Play a Video File
% Read video from a file and set up player object. 

%%

%read video
videoFReader = vision.VideoFileReader('..\..\media\PeopleVideo\people_supermarket_2.mp4');
videoPlayer = vision.VideoPlayer;

detector = peopleDetectorACF;
count = 0;

%write video
v = VideoWriter('..\..\media\test_store_video_2.avi');
open(v);%open videofile handler

%%
% Play video. Every call to the |step| method reads another frame.

while ~isDone(videoFReader)
    frame = step(videoFReader);
    count = count +1;

	I = frame;
	[bboxes,scores] = detect(detector,I);%run detector
    
    
    if ~isempty([bboxes,scores])
        frame = insertText(frame,[0 0],'detected');
        frame = insertObjectAnnotation(I,'rectangle',bboxes,scores);
    end
    
    %frame = insertText(frame,[0 0],'detected');
    step(videoPlayer,frame);
    writeVideo(v,frame);%save frame to video file
    
end

%%
% Close the file reader and video player.
close(v);%close video file  handler
release(videoFReader);
release(videoPlayer);