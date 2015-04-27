function [AL,VL]=test_speaker(num_train_speakers,test_speaker_index)
% Tests a speaker of speaker_index say 2 against all others

AL=[]
VL=[];

    for i=1:num_train_speakers

        % Copy speaker data to workbench
        restoredefaultpath
        cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
        
%         j=2;
        src='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\test\'
        destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
        copy_test_speaker_data(src,destination,test_speaker_index)
        
        
        % Copy trained hmms to workbench
        restoredefaultpath
        cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp'
        
        src='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train\';
        destination='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\work_board\';
        copy_trained_hmms(src,destination,i)

        % Test test data with trained hmm
        restoredefaultpath;
        cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp';
        word='chennai';
        [al,vl]=test_hmm(destination,word)
        cd 'C:\Users\TheatroIT\Documents\MSP\Matlab\AudioVisualCrisp';

        [AL]=[AL;al];
        [VL]=[VL;vl];

    end
end