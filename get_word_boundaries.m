function [bound_audio,bound_video]=get_word_boundaries(word,filename,audio_fs,video_fs)
% Reads a transcritipn and looks up for a word and returns word boundaries

[s,e,w]=read_transcription(filename)
index=strmatch(word,w)


time=round([s e]*audio_fs)
bound_audio=time(index,:)

time=round([s e]*video_fs)
bound_video=time(index,:)


end