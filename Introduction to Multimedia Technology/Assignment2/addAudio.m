nFrames = 4800;
videoFReader = vision.VideoFileReader('movie_24_4800.mp4');
[AUDIO,Fs] = audioread('Ether.mp3');
videoFWriter = vision.VideoFileWriter('Final.avi','FrameRate',videoFReader.info.VideoFrameRate,'AudioInputPort',true);

%val = size(AUDIO,1)/nFrames;
val = Fs/videoFReader.info.VideoFrameRate;

for i=1:nFrames
    videoFrame = step(videoFReader);
    step(videoFWriter, videoFrame, AUDIO(val*(i-1)+1:val*i,:));
end

release(videoFReader);
release(videoFWriter);