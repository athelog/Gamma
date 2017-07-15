%% Play a Video File
% Read video from a file and set up player object. 

%%

videoFReader = vision.VideoFileReader('..\..\media\PeopleVideo\people_supermarket_1.mp4');
videoPlayer = vision.VideoPlayer;

detector = peopleDetectorACF;
count = 0;
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
    
end

%%
% Close the file reader and video player.

release(videoFReader);
release(videoPlayer);