clc
close all
clear all

% Traiin with one speaker
restoredefaultpath;
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp';
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s1\';
word='mango';
wavefile='amdc.wav'
videofile='amdc.mp4'
train_hmm(speaker_directory,word,wavefile,videofile);

% Traiin with second speaker
restoredefaultpath;
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp';
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s2\';
word='chennai';
wavefile='amdc.wav'
videofile='amdc.mp4'
train_hmm(speaker_directory,word,wavefile,videofile);


% Traiin with third speaker
restoredefaultpath
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp';
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\s3\';
word='lolapaluza';
wavefile='amdc.wav'
videofile='amdc.mp4'
train_hmm(speaker_directory,word,wavefile,videofile);


destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\test\';
for i=1:3
    train_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\';
    
    src=sprintf('%ss%d\\%s',train_directory,i,'word_audio_hmm.mat');
    dest=sprintf('%ss%d\\%s',destination,i,'word_audio_hmm.mat');
    copyfile(src,dest);
    
    src=sprintf('%ss%d\\%s',train_directory,i,'word_video_hmm.mat');
    dest=sprintf('%ss%d\\%s',destination,i,'word_video_hmm.mat');
    copyfile(src,dest);
end


% Test with another
restoredefaultpath;
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp';
speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\test\s2\';
word='chennai';
wavefile='amdc.wav'
videofile='amdc.mp4'
train_hmm(speaker_directory,word,wavefile,videofile);
[al,vl]=test_hmm(speaker_directory,word,wavefile,videofile);
cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp';



