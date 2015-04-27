function [audio_liklihood,video_liklihood]=test_hmm(speaker_directory,word,wavefile,videofile)
% Date 21 April

display('Testing')


filename=sprintf('%stranscription.txt',speaker_directory);
audio_fs=44000;
video_fs=24;
% word='chennai'
[bound_audio_word,bound_video_word]=get_word_boundaries(word,filename,audio_fs,video_fs)



% test

%% Read audio from files. These files were obtained by using VLC to Convert mp4 to wav files
%  audio_word=sprintf('%samdc.wav',speaker_directory);
 audio_word=sprintf('%s%s',speaker_directory,wavefile)

[y fs]=audioread(audio_word);
sig_word=y(:,1);

display('Length of wav file is ')
size(y)

%% Read video data
videoFolder=speaker_directory;
% videoFolderWord=sprintf('%s\\amdc\\',videoFolder)

 features_word=visual_features_manager(videoFolder,videofile);
%  features_word=visual_features_manager(videoFolder,'amdc.mp4');

CWORD=features_word;


%%

display('Loading Video HMM')
load(sprintf('%sword_video_hmm.mat',speaker_directory));
%% Video Boundaries
sample_index=1; %  This can thorow a error if you set it to 100.100 samples of word may not exist
CWORDSample=CWORD(bound_video_word(sample_index,1):bound_video_word(sample_index,2),:);


fword=CWORDSample';

% % dynamic_features;
% dyf=(diff(fword'))';
% last=dyf(:,end);
% fword=[fword;[dyf last]];
% %end


% tokenNo=normalise(fyn(1:15,:))
tokenNo=normalise(fword(1:20,:));

cd C:\Users\TheatroIT\Documents\MSP\Matlab\FullBNT-1.0.7\bnt;
addpath(genpathKPM(pwd));
addpath('C:\Users\TheatroIT\Documents\MSP\Matlab\rastamat')

display('Evaluating Video HMM ');
pwd
video_liklihood = mhmm_logprob(tokenNo, prior1, transmat1, mu1, Sigma1, mixmat1);



%% 
display('Loading Audio HMM');
load(sprintf('%sword_audio_hmm.mat',speaker_directory));

%% Audio Boundaries
sample_index=1; %  This can thorow a error if you set it to 100.100 samples of word may not exist
WORD=sig_word(bound_audio_word(sample_index,1):bound_audio_word(sample_index,2),:);

% sig=sigNo(noAudioB(2):noAudioB(3),:);



fword=melfcc(WORD');

% dynamic_features;
dyf=(diff(fword'))';
last=dyf(:,end);
fword=[fword;[dyf last]];
%end

token=normalise(fword(1:24,:));

display('Evaluating Audio HMM ')
audio_liklihood = mhmm_logprob(token, prior1, transmat1, mu1, Sigma1, mixmat1);


end