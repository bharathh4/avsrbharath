function mouth_image=get_mouth_region(image)

I1=image;
I2=rgb2gray(I1);
I=I2;
% I=imresize(I2,1/20);
%To detect Mouth

MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',16);
BB=step(MouthDetect,I);

%% BB gives location of mouth ---- topleft as reference (0,0). (x,y,width,height)
% figure,
% imshow(I); hold on

BB_actual=[];

for i = 1:size(BB,1)
%  rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
    temp=BB(i,:);
    if(temp(2)>round(size(I,1)/2))
        
%         display('Mouth corner')
        BB_actual=temp;
        
    end
end

if(size(BB,1)==0)
   
    BB_actual=[300 1500 500 200];% return a default location if no mouth is found
    display('No mouth')
    
elseif(~size(BB_actual))
   BB_actual=BB(1,:); 
end



% 
% figure
% imshow(imcrop(I,BB))


% mouth_image=imcrop(I,BB(1,:));
mouth_image=imcrop(I,BB_actual);


end