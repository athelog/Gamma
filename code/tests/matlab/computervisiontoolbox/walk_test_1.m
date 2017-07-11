%% Play a Video File
% Read video from a file and set up player object. 

%%

videoFReader = vision.VideoFileReader('C:\Users\Public\Videos\Sample Videos\walk.mp4');
videoPlayer = vision.VideoPlayer;
count = 0;
%%
% Play video. Every call to the |step| method reads another frame.

while ~isDone(videoFReader)
   frame = step(videoFReader); %this is the individual image
   step(videoPlayer,frame);
   count = count +1;
   
   if count%3==0
   
       %convert image to RGB
        R = frame(:,:,1);
        G = frame(:,:,2);
        B = frame(:,:,3);

        %adapted from "piel.m"
        img=rgb2ycbcr(frame);
        y=img(:,:,1);
        cb=img(:,:,2);
        cr=img(:,:,3);

        Y=0.299*R+0.587*G+0.114*B;
        CR=R-Y;
        CB=B-Y;

        for i=1:size(frame,1)
            for j= 1:size(I,2)
                if(CR(i,j)>CB(i,j))
                    im(i,j)=255;
                else
                    im(i,j)=0;
                end

            end
        end   

        imshow(im);
        impixelinfo;
        drawnow;
    
   end
    
    
end

%%
% Close the file reader and video player.

release(videoFReader);
release(videoPlayer);