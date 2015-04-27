function create_eigenvectors_fulldata()
% Determines principles projections of major  variations for all testing
% data
temp=[];
for j=1:7
    
    folder='C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\train';
    speaker_folder=sprintf('\\s%d',j)
    videoname='\amdc.mp4'
    filename=sprintf('%s%s%s',folder,speaker_folder,videoname)
    
    % returns reduced dataset visual features
    video_object=VideoReader(filename);
    
    for i=1:video_object.NumberOfFrames
        
        % rgb to gray happens in get_mouth_region()
        frame=imrotate((read(video_object,i)),90);
        
        % frameRE=imresize(frame, [326 150]);
        mouth_image=get_mouth_region(frame);
        frameRE=imresize(mouth_image, [200 500]);
        temp=[temp ;reshape(frameRE,1,size(frameRE,1)*size(frameRE,2))];
    end
    
    imshow(frameRE)
    
    
end


% size(temp);
num_dim_to_project_onto=20;
[y,eigenvectors,mean_vector]=reduce_dim(double(temp),num_dim_to_project_onto);

save('C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\eigenvectors\eigenvectors.mat','eigenvectors')
save('C:\Users\TheatroIT\Documents\MSP\Matlab\Speakers\eigenvectors\mean_vector.mat','mean_vector')

end
