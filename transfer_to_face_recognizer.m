function transfer_to_face_recognizer()
% Transfers images to face recognizer



format long

% % Traiin with one speaker
restoredefaultpath
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s1\'
destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Face recognizerVideo\train\s1\raw\'
word='mango'
wavfile='amdc.wav'
videofile='amdc.mp4'
transfer(speaker_directory,word,videofile,destination)
% 
% Traiin with second speaker
restoredefaultpath
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s2\'
destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Face recognizerVideo\train\s2\raw\'
word='chennai'
wavfile='amdc.wav'
videofile='amdc.mp4'
transfer(speaker_directory,word,videofile,destination)
% 
% Traiin with third speaker
restoredefaultpath
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s3\'
destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Face recognizerVideo\train\s3\raw\'
word='lolapaluza'
wavfile='amdc.wav'
videofile='amdc.mp4'
transfer(speaker_directory,word,videofile,destination)
% 
% % Traiin with fourth speaker
% restoredefaultpath
% cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
% speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s4\'
% destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Face recognizerVideo\train\s4\raw\'
% word='miscellaneous'
% wavfile='amdc.wav'
% videofile='amdc.mp4'
% transfer(speaker_directory,word,videofile,destination)
% 
% % Traiin with fifth speaker
% restoredefaultpath
% cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
% speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s5\'
% destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Face recognizerVideo\train\s5\raw\'
% word='richardson'
% wavfile='amdc.wav'
% videofile='amdc.mp4'
% transfer(speaker_directory,word,videofile,destination)
% 
% % Traiin with sixth speaker
% restoredefaultpath
% cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
% speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s6\'
% destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Face recognizerVideo\train\s6\raw\'
% word='entourage'
% wavfile='amdc.wav'
% videofile='amdc.mp4'
% transfer(speaker_directory,word,videofile,destination)

% Traiin with seventh speaker
% restoredefaultpath
% cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
% speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s7\'
% destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Face recognizerVideo\train\s7\raw\'
% word='bluethinman'
% wavfile='amdc.wav'
% videofile='amdc.mp4'
% transfer(speaker_directory,word,videofile,destination)
end


function transfer(speaker_directory,word,videofile,destination)


% Get Bounds in samples for the respective word by using the transcription file.
filename=sprintf('%stranscription.txt',speaker_directory);
% filename='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\s1\transcription.txt'
audio_fs=44000;
video_fs=24;
[bound_audio_word,bound_video_word]=get_word_boundaries(word,filename,audio_fs,video_fs);


% filename=sprintf('%s%s',speaker_directory,videofile);
% %% Read video data
% % Returns images vector
% video_object=VideoReader(filename);
% temp=[];
% for i=1:video_object.NumberOfFrames
%     
%  % rgb to gray happens in get_mouth_region()
% frame=imrotate((read(video_object,i)),90);
% 
% frameRE=rgb2gray(frame);
% temp=[temp ;reshape(frameRE,1,size(frameRE,1)*size(frameRE,2))];
% 
% end
% 
% sample_index=1; %  This can thorow a error if you set it to 100.100 samples of word may not exist
% images_vectors=temp(bound_video_word(sample_index,1):bound_video_word(sample_index,2),:);
% image_vectors_filename='image_vectors.mat';
% save(sprintf('%s%s',destination,image_vectors_filename),'images_vectors')
% 
% end


filename=sprintf('%s%s',speaker_directory,videofile);
%% Read video data
% Returns images vector
video_object=VideoReader(filename);
temp=[];
for i=1:video_object.NumberOfFrames
    
 % rgb to gray happens in get_mouth_region()
frame=imrotate((read(video_object,i)),90);

%   figure(1);imagesc(frame);
  thisfile=sprintf('%s%d.jpg',destination,i);
  imwrite(frame,thisfile);
end

% sample_index=1; %  This can thorow a error if you set it to 100.100 samples of word may not exist
% images_vectors=temp(bound_video_word(sample_index,1):bound_video_word(sample_index,2),:);
% image_vectors_filename='image_vectors.mat';
% save(sprintf('%s%s',destination,image_vectors_filename),'images_vectors')

end
