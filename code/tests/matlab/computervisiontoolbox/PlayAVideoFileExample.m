%% Play a Video File
% Read video from a file and set up player object. 

%%

videoFReader = vision.VideoFileReader('C:\Users\Public\Videos\Sample Videos\walk.mp4');
videoPlayer = vision.VideoPlayer;

%%
% Play video. Every call to the |step| method reads another frame.

while ~isDone(videoFReader)
   frame = step(videoFReader);
   step(videoPlayer,frame);
end

%%
% Close the file reader and video player.

release(videoFReader);
release(videoPlayer);