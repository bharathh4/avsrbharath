function f=visual_features_manager(folder,videoname)
% returns precomputed features set if available. If not calculates it all
% over again

filename=sprintf('%sfeatures.mat',folder)

if exist(filename, 'file')
 display('Hey there is a precomputed reduced-dataset which being returned')
 
 load(filename)
 f=features;
 
else
%   % File does not exist.
%   warningMessage = sprintf('Warning: file does not exist:\n%s', videoFileYes);
%   uiwait(msgbox(warningMessage));

display('I think I need to calculate it all over again')
filename=sprintf('%s%s',folder,videoname)

% f=get_visual_features(filename);
% f=get_visual_features_with_mouth_detector(filename);

eigenvectors_folder='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\eigenvectors'
f=get_visual_features_with_mouth_detector_eigmethod(filename,eigenvectors_folder)

features=f;
save(sprintf('%sfeatures.mat',folder),'features')


end





end