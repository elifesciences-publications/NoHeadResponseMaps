% Specify file to load
% MLcurr_data = ML response  maps w/ size  x by y by number images
% Expimages = Corresponding images w/ size RGB x number images
% PLcurr_data = PL response  maps w/ size  x by y by number images
load('Monkey1_Figure1_responsemaps.mat')

% Determine number of images from matrix size
num_images=size(Expimages,4);

% response map transparency
overlay_transparency= 0.5;

% Visualize ML array response maps
% underlay will be original image
% semi-transparent overlay will be response maps
 for curr_image = 1:num_images
     figure

     % plot underlay image
     image_underlay=Expimages(:,:,:,curr_image);
     imagesc(image_underlay); set(gca,'ydir','normal')
     hold on
     axis off

     % plot overlay image
     % due to nature of mapping, image has to be flipped to match underlay
     curr_dataML=flipud(MLcurr_data(:,:,curr_image));
     OverlayImage = imagesc(curr_dataML); set(gca,'ydir','normal')

     % set color map and transparency
     colormap( OverlayImage.Parent, jet );
     alpha = (~isnan(curr_dataML))*overlay_transparency;
     set( OverlayImage, 'AlphaData', alpha );

     % set min max range of overlay
     caxis([prctile(curr_dataML(:),.5),prctile(curr_dataML(:),99.5)])
 end


% Visualize PL array resposne maps - only for Monkey 1 Fig 1
 for curr_image = 1:num_images
     figure

     % plot underlay image
     image_underlay=Expimages(:,:,:,curr_image);
     imagesc(image_underlay); set(gca,'ydir','normal')
     hold on
     axis off

     % plot overlay image
     % due to nature of mapping, image has to be flipped to match underlay
     curr_dataPL=flipud(PLcurr_data(:,:,curr_image));
     OverlayImage = imagesc(curr_dataPL); set(gca,'ydir','normal')

     % set color map and transparency
     colormap( OverlayImage.Parent, jet );
     alpha = (~isnan(curr_dataPL))*overlay_transparency;
     set( OverlayImage, 'AlphaData', alpha );

     % set min max range of overlay
     caxis([prctile(curr_dataPL(:),.5),prctile(curr_dataPL(:),99.5)])
 end



  % Visualize ML array resposne maps - only for Monkey 1 Fig 2
for curr_image = 1:num_images
     figure
     curr_dataML=[];
     image_underlay=[];
     for current_window=1:size(MLcurr_data,3)
        currImageRF=MLcurr_data(:,:,current_window,curr_image);
        curr_dataML=[curr_dataML,flipud(currImageRF)];
        image_underlay=[image_underlay,uint8(Expimages(:,:,:,curr_image))];
     end
     imagesc(image_underlay); set(gca,'ydir','normal')
     hold on
     axis off
     OverlayImage = imagesc(curr_dataML); set(gca,'ydir','normal')
     colormap( OverlayImage.Parent, jet );
     alpha = (~isnan(curr_dataML))*0.5;
     set( OverlayImage, 'AlphaData', alpha );
     caxis([prctile(curr_dataML(:),.5),prctile(curr_dataML(:),99.5)])
 end


 % Visualize PL array resposne maps - only for Monkey 1 Fig 2
 for curr_image = 1:num_images
     figure
     curr_dataPL=[];
     image_underlay=[];
     for current_window=1:size(PLcurr_data,3)
        currImageRF=PLcurr_data(:,:,current_window,curr_image);
        curr_dataPL=[curr_dataPL,flipud(currImageRF)];
        image_underlay=[image_underlay,uint8(Expimages(:,:,:,curr_image))];
     end
     imagesc(image_underlay); set(gca,'ydir','normal')
     hold on
     axis off
     OverlayImage = imagesc(curr_dataPL); set(gca,'ydir','normal')
     colormap( OverlayImage.Parent, jet );
     alpha = (~isnan(curr_dataPL))*0.5;
     set( OverlayImage, 'AlphaData', alpha );
     caxis([prctile(curr_dataPL(:),.5),prctile(curr_dataPL(:),99.5)])
 end
