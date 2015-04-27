function y=get_visual_features_with_mouth_detector_eigmethod(filename,eigenvectors_folder)
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

% save(sprintf('%sfeatures.mat',folder),'frameRE')


% % size(temp);
% num_dim_to_project_onto=20;
% [y,eigenvectors,mean_vector]=reduce_dim(double(temp),num_dim_to_project_onto);

eigen_vectors_filename='\eigenvectors.mat'
mean_vector_filename='\mean_vector.mat'
load(sprintf('%s%s',eigenvectors_folder,eigen_vectors_filename));
load(sprintf('%s%s',eigenvectors_folder,mean_vector_filename));

u=double(eigenvectors);
%Normalise the training samples by subrating the mean
C1=double(temp);
M=size(C1,1);
for i=1:M
    hold=C1(i,:)-mean_vector;
    C1(i,:)=hold;
end

num_dim_to_project_onto=20;
% Project into lower dimensions by taking dot product with eigen-vectors
CNew1=[];
for h=1:M
    temp=[];
    
    if(size(u,2)<num_dim_to_project_onto)
        display('Hey I dont think the dataset varies enough to have so many eigenvectors.Try reducing the num of dim to reduce one less than unique images')
    end
    
    for i=1:num_dim_to_project_onto %the number of eigen-vectors
        temp=[temp dot(u(:,i),C1(h,:))];
    end
    
    CNew1=[CNew1;temp];
    
end

y=CNew1;

end