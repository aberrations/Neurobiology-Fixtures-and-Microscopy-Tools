% Image J Preprocessing Script

clear
clc

% Locates folder, creates subdirectory, sorts miniscope videos.

VIDEO_DIRECTORY = 'Y:\SteveG\V1 Ket Project\V1 Mini Ket\Exp1 06222017\6_16_2017_V1_basline_5min_square box_section1_8 mice\6_16_17_V1_baseline_5min_Mouse 3square0_session1';
cd(VIDEO_DIRECTORY);
tmp = dir('msCam*');
videoList = {tmp.name}';
mkdir('preprocessing');

% Initializes videos with settings of first miniscope camera video.
ConcatenatedMiniscope=VideoWriter(fullfile(VIDEO_DIRECTORY,'preprocessing/ConcatenatedMiniscope.avi'));
inputVideo_init = VideoReader(videoList{1}); % first video
ConcatenatedMiniscope.FrameRate = inputVideo_init.FrameRate;
open(ConcatenatedMiniscope) % open stream

% Iterates over all videos in videoList, writes to
% ConcatenatedMiniscope.avi in one concatenated video.
for i = 1:length(videoList)
    inputVideo = VideoReader(videoList{i});
    while hasFrame(inputVideo)
        writeVideo(ConcatenatedMiniscope, readFrame(inputVideo));
    end
end

obj = mmread('ConcatenatedMiniscope.avi');
tif = read(obj);
frames = obj.NumberOfFrames;
for x = 1 : 2 : frames
    imwrite(tif(:,:,:,x),strcat('frame-',num2str(x),'.tif'));
end
% 
% for i=1:2:ConcatenatedMiniscope.FrameCount
%     while hasFrame(ConcatenatedMiniscope)
%         writeVideo(ReducedVideo, readFrame(ConcatenatedMiniscope));
%     end
% end
% 
% % Mathworks demo located @ mathworks.com/help/matlab/examples/convert-between-image-sequences-and-video.html
% 
% % Reducing Framerate
% 
% % Open the rhino.avi demo movie that ships with MATLAB.
% % First get the folder that it lives in.
% folder = fileparts(which('ConcatenatedMiniscope.avi')); % Determine where demo folder is (works with all versions).
% % Pick one of the two demo movies shipped with the Image Processing Toolbox.
% % Comment out the other one.
% inputFullFileName = fullfile(folder, 'ConcatenatedMiniscope.avi');
% % movieFullFileName = fullfile(folder, 'traffic.avi');
% % Check to see that it exists.
% if ~exist(inputFullFileName, 'file')
%   strErrorMessage = sprintf('File not found:\n%s\nYou can choose a new one, or cancel', inputFullFileName);
%   response = questdlg(strErrorMessage, 'File not found', 'OK - choose a new movie.', 'Cancel', 'OK - choose a new movie.');
%   if strcmpi(response, 'OK - choose a new movie.')
%     [baseFileName, folderName, FilterIndex] = uigetfile('*.avi');
%     if ~isequal(baseFileName, 0)
%       inputFullFileName = fullfile(folderName, baseFileName);
%     else
%       return;
%     end
%   else
%     return;
%   end
% end
% 
% % Open up the VideoReader for reading an input video file.
% inputVideoReaderObject = VideoReader(inputFullFileName);
% % Determine how many frames there are.
% numberOfFrames = inputVideoReaderObject.NumberOfFrames;
% inputVideoRows = inputVideoReaderObject.Height;
% inputVideoColumns = inputVideoReaderObject.Width;
% 
% % Create a VideoWriter object to write the video out to a new, different file.
% outputFullFileName = fullfile(pwd, 'ResizedMiniscope.avi');
% outputVideoWriterObject = VideoWriter(outputFullFileName);
% open(outputVideoWriterObject);
% % Specify the output video size.
% shrinkFactor = 4; % Shrink by a factor of 4 in both directions.
% outputVideoRows = round(inputVideoRows / shrinkFactor);
% outputVideoColumns = round(inputVideoColumns / shrinkFactor);
% 
% numberOfFramesWritten = 0;
% % Prepare a figure to show the images in the upper half of the screen.
% figure;
% %   screenSize = get(0, 'ScreenSize');
% % Enlarge figure to full screen.
% set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
% 
% % Loop through the movie, writing all frames out.
% for frame = 1 : numberOfFrames
%   % Extract the frame from the movie structure.
%   thisInputFrame = readFRAME(inputVideoReaderObject, frame);
%   
%   % Display it
%   image(thisInputFrame);
%   axis on;
%   axis image;
%   caption = sprintf('Frame %4d of %d.', frame, numberOfFrames);
%   title(caption, 'FontSize', fontSize);
%   drawnow; % Force it to refresh the window.
%   
%   % Resize the image.
%   outputFrame = imresize(thisInputFrame, [outputVideoRows, outputVideoColumns]);
%   
%   % Write this new, resized frame out to the new video file.
%   writeVideo(outputVideoWriterObject, outputFrame);
%   
%   % Update user with the progress.  Display in the command window.
%   progressIndication = sprintf('Processed frame %4d of %d.', frame, numberOfFrames);
%   disp(progressIndication);
%   % Increment frame count (should eventually = numberOfFrames
%   % unless an error happens).
%   numberOfFramesWritten = numberOfFramesWritten + 1;
% end
% % Close the output video object.  You don't need to close the input video reader..
% close(outputVideoWriterObject);
% 
% release(vidobj);
% release(viewer);