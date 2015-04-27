function copy_test_speaker_data(src,destination,j)
% Copies test features and transcription to workbench

        test_speaker_directory=src;
        workbench_directory=destination;
 %% Load testing data of a speaker
        wav_filename='\amdc.wav';
        transcription_filename='\transcription.txt';
       
        % Copy  speaker data with each trained speaker
        restoredefaultpath
        cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
        
%         test_speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\test\'
%         workbench_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
        features_filename='\features.mat'
        transcription_filename='\transcription.txt';
        
        src=sprintf('%ss%d%s',test_speaker_directory,j,wav_filename);
%         destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
        copyfile(src,destination);
        
        src=sprintf('%ss%d%s',test_speaker_directory,j,transcription_filename);
%         destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
        copyfile(src,destination);

        
        videofile='amdc.mp4'
        videoFolder=sprintf('%ss%d\\',test_speaker_directory,j);
        features_word=visual_features_manager(videoFolder,videofile);

        
        src=sprintf('%ss%d%s',test_speaker_directory,j,features_filename);
%         destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
        copyfile(src,destination); 


        
end

  
