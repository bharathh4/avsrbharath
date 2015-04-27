function train_hmm(speaker_directory,word,wavefile,videofile)
% Date : 21 April 


filename=sprintf('%stranscription.txt',speaker_directory);

% filename='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\s1\transcription.txt'
audio_fs=16000;
video_fs=24;
% word='dallas'
[bound_audio_word,bound_video_word]=get_word_boundaries(word,filename,audio_fs,video_fs);

% filename='C:\Users\TheatroIT\Documents\MSP\Matlab\yesnovideo\yes\transcription.txt'
% audio_fs=16000;
% video_fs=24;
% word='Yes'
% [bound_audio_yes,bound_video_yes]=get_word_boundaries(word,filename,audio_fs,video_fs)

% train

%% Read audio from files. These files were obtained by using VLC to Convert mp4 to wav files

 audio_word=sprintf('%s%s',speaker_directory,wavefile);
%  audio_word=sprintf('%samdc.wav',speaker_directory);


[y fs]=audioread(audio_word);
sig_word=y(:,1);

display('Read audio')

%% Read video data

videoFolder=speaker_directory;

% videoFolderWord=sprintf('%s\\amdc\\',videoFolder)

% the mouth detector hasn't been tested via this interface
%  features_word=visual_features_manager(videoFolder,'amdc.mp4');
 features_word=visual_features_manager(videoFolder,videofile);

CWORD=features_word;

display('Read video')

%% Video Boundaries
sample_index=1; %  This can thorow a error if you set it to 100.100 samples of word may not exist
CWORDSample=CWORD(bound_video_word(sample_index,1):bound_video_word(sample_index,2),:);
display('Just pulled up a sample for a word in video')
%% Audio Boundaries
sample_index=1; %  This can thorow a error if you set it to 100.100 samples of word may not exist
WORD=sig_word(bound_audio_word(sample_index,1):bound_audio_word(sample_index,2),:);
display('Just pulled up a sample for a word in audio')
%% Create Visual HMM

cd C:\Users\TheatroIT\Documents\MSP\Matlab\FullBNT-1.0.7\bnt;
addpath(genpathKPM(pwd));
addpath('C:\Users\TheatroIT\Documents\MSP\Matlab\rastamat');


fword=CWORDSample';

% % dynamic_features;
% dyf=(diff(fword'))';
% last=dyf(:,end);
% fword=[fword;[dyf last]];
% %end

obs1=normalise(fword(1:20,:));



O=20;
T=size(obs1,2);
nex=1;
M=2;
Q=3;
cov_type='full'
data=obs1;
prior0 = normalise(rand(Q,1));
transmat0 = mk_stochastic(rand(Q,Q));
Sigma0 = repmat(eye(O), [1 1 Q M]);
  % Initialize each mean to a random data point
  indices = randperm(T*nex);
  mu0 = reshape(data(:,indices(1:(Q*M))), [O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));



  
% HMM for WORD  
  
[LL1, prior1, transmat1, mu1, Sigma1, mixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', 5);



%% save hmms for words

          
file_hmm=sprintf('%sword_video_hmm.mat',speaker_directory);
save(file_hmm,'prior1', 'transmat1', 'mu1', 'Sigma1', 'mixmat1');

%%

% CNoSample=CNO(noVideoB(5):noVideoB(6),:);
% fyn=CNoSample';
    

%% Create Audio HMM


fword=melfcc(WORD');

% dynamic_features;
dyf=(diff(fword'))';
last=dyf(:,end);
fword=[fword;[dyf last]];
%end

obs1=normalise(fword(1:24,:));

O=24;
T=size(obs1,2);
nex=1;
M=3;
Q=6;
cov_type='full'
data=obs1;
prior0 = normalise(rand(Q,1));
transmat0 = mk_stochastic(rand(Q,Q));
Sigma0 = repmat(eye(O), [1 1 Q M]);
  % Initialize each mean to a random data point
  indices = randperm(T*nex);
  mu0 = reshape(data(:,indices(1:(Q*M))), [O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));



  
% HMM for WORD  
  
[LL1, prior1, transmat1, mu1, Sigma1, mixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', 10);



%%
%% save hmms for words
file_hmm=sprintf('%sword_audio_hmm.mat',speaker_directory);
save(file_hmm,'prior1', 'transmat1', 'mu1', 'Sigma1', 'mixmat1');


end
