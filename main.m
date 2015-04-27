clc
close all
clear all


format long

% Traiin with one speaker
restoredefaultpath
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s1\'
word='mango'
wavfile='amdc.wav'
videofile='amdc.mp4'
train_hmm(speaker_directory,word,wavfile,videofile)

% Traiin with second speaker
restoredefaultpath
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s2\'
word='chennai'
wavfile='amdc.wav'
videofile='amdc.mp4'
train_hmm(speaker_directory,word,wavfile,videofile)


% Traiin with third speaker
restoredefaultpath
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s3\'
word='lolapaluza'
wavfile='amdc.wav'
videofile='amdc.mp4'
train_hmm(speaker_directory,word,wavfile,videofile)


% Traiin with fourth speaker
restoredefaultpath
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s4\'
word='miscellaneous'
wavfile='amdc.wav'
videofile='amdc.mp4'
train_hmm(speaker_directory,word,wavfile,videofile)


% Traiin with fifth speaker
restoredefaultpath
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s5\'
word='richardson'
wavfile='amdc.wav'
videofile='amdc.mp4'
train_hmm(speaker_directory,word,wavfile,videofile)




% Traiin with sixth speaker
restoredefaultpath
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s6\'
word='entourage'
wavfile='amdc.wav'
videofile='amdc.mp4'
train_hmm(speaker_directory,word,wavfile,videofile)




% Traiin with seventh speaker
restoredefaultpath
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s7\'
word='bluethinman'
wavfile='amdc.wav'
videofile='amdc.mp4'
train_hmm(speaker_directory,word,wavfile,videofile)




AL=[]
VL=[]

prediction_audio=[]
prediction_video=[]
prediction_audiovideo=[]
ground_truth=[]
words={'mango','chennai','lolapaluza','miscellaneous','richardson','entourage','bluethinman'}
first_speaker_index=1

% there is a problem with i=1
for j=first_speaker_index:7
   
     AL=[];
     VL=[];

    % there is a problem with i=1
    for i=first_speaker_index:7

        %% Load trained hmm of each speaker. Small change in comment
%         all_speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\'
%         audio_hmm_filename='\word_audio_hmm.mat';
%         video_hmm_filename='\word_video_hmm.mat';
% 
%         src=sprintf('%ss%d%s',all_speaker_directory,i,audio_hmm_filename)
%         destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
%         copyfile(src,destination);
%         src=sprintf('%ss%d%s',all_speaker_directory,i,video_hmm_filename)
%         destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
%         copyfile(src,destination);

        % Replaced the above commented section callled "Load trained hmm of each speaker"
        src='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\';
        destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
        copy_trained_hmms(src,destination,i);
        
        
        %% Load testing data of a speaker
%         wav_filename='\amdc.wav';
%         transcription_filename='\transcription.txt';
%        
%         % Copy  speaker data with each trained speaker
%         restoredefaultpath
%         cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
%         
%         test_speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\test\'
%         workbench_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
%         features_filename='\features.mat'
%         transcription_filename='\transcription.txt';
%         
%         src=sprintf('%ss%d%s',test_speaker_directory,j,wav_filename);
%         destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
%         copyfile(src,destination);
%         
%         src=sprintf('%ss%d%s',test_speaker_directory,j,transcription_filename);
%         destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
%         copyfile(src,destination);
% 
%         
%         videofile='amdc.mp4'
%         videoFolder=sprintf('%ss%d\\',test_speaker_directory,j);
%         features_word=visual_features_manager(videoFolder,videofile);
% 
%         
%         src=sprintf('%ss%d%s',test_speaker_directory,j,features_filename);
%         destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
%         copyfile(src,destination); 

            % Achives the above code block via a function             

            src='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\test\';
            destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
            copy_test_speaker_data(src,destination,j)
        
        % Test with speakers
        restoredefaultpath
        cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
        destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
        word=words{j}
        wavfile='amdc.wav'
        videofile='amdc.mp4'
        [al,vl]=test_hmm(destination,word,wavfile,videofile)
       

        cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'

        AL=[AL;al]
        VL=[VL;vl]

    end

    [val index]=max(AL); 
    display(sprintf('The audio hmm says  %d',index));
    prediction_audio=[prediction_audio;index+(first_speaker_index-1)];
    [val index]=max(VL); 
    display(sprintf('The video hmm says  %d',index));
    prediction_video=[prediction_video;index+(first_speaker_index-1)];

    [val index]=max(normalize(AL)+normalize(VL)); 
    display(sprintf('The audio-video combined hmm says  %d',index));
    prediction_audiovideo=[prediction_audiovideo;index+(first_speaker_index-1)];

    ground_truth=[ground_truth;j];
end

results=[prediction_audio prediction_video prediction_audiovideo ground_truth]
csvwrite('results.csv',results)


% % Test with anothera
% restoredefaultpath
% cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
% speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\test\s2\'
% word='chennai'
% test_hmm(speaker_directory,word)
% cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'



