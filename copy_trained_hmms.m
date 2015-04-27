function copy_trained_hmms(src,destination,i)
% Copies trained hmms of each speaker i from training folder to workbench to
% testing is done


        all_speaker_directory=src;
     %% Load trained hmm of each speaker
%         all_speaker_directory='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\'
        audio_hmm_filename='\word_audio_hmm.mat';
        video_hmm_filename='\word_video_hmm.mat';

        src=sprintf('%ss%d%s',all_speaker_directory,i,audio_hmm_filename)
%         destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
        copyfile(src,destination);
        src=sprintf('%ss%d%s',all_speaker_directory,i,video_hmm_filename)
%         destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
        copyfile(src,destination);
    
end

  
