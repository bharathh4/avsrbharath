function y=get_visual_features_with_mouth_detector(filename)
% returns reduced dataset visual features
video_object=VideoReader(filename);

temp=[];
for i=1:video_object.NumberOfFrames
    
 % rgb to gray happens in get_mouth_region()
frame=imrotate((read(video_object,i)),90);

% frameRE=imresize(frame, [326 150]);
mouth_image=get_mouth_region(frame);
frameRE=imresize(mouth_image, [200 500]);
temp=[temp ;reshape(frameRE,1,size(frameRE,1)*size(frameRE,2))];
end

imshow(frameRE)

% size(temp);
num_dim_to_project_onto=20;
[y,eigenvectors,mean_vector]=reduce_dim(double(temp),num_dim_to_project_onto);


end