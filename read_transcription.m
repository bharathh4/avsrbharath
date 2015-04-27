function [starttime,endtime,word]=read_transcription(filename)
% Reads a transcription file 
[starttime,endtime,word]=textread(filename,'%f %f %s','delimiter', ' ');


end

