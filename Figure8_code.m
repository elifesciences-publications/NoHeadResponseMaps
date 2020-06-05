% AlexNet analyses
clear all
image_dir='';

net = alexnet;
featureLayers = {'data','conv1','relu1','conv2','relu2','conv3','relu3','conv4','relu4','conv5','relu5','fc6','relu6','fc7','relu7','fc8','prob'};
currentActivations=cell(length(featureLayers));
image_size=[227 227];
    
clear picsForAlex imds currentActivations
imds=imageDatastore(image_dir,'IncludeSubfolders',1,'FileExtensions',{'.jpg','.png','.bmp'});
picsForAlex=nan(image_size(1),image_size(2),3,size(imds.Files,1));

% Grab images from directory and resize
for imno=1:size(imds.Files,1)
    imtoinput=char(imds.Files{imno});
    imtoinput(find(imtoinput=='\'))='/';

    tPic = imread(imtoinput);
    %tPic=mean(tPic,3);
    if size(tPic,3) < 3
        tPic = cat(3, tPic, tPic, tPic);
    end
    tPic = im2double(tPic);
    tPic=imresize(tPic,[image_size(1) image_size(2)]);
    picsForAlex(:,:,:,imno) = tPic;
end

% Get activations for each image from specified layers
for curr_layer = 1:length(featureLayers)
    currentActivations = activations(net,picsForAlex, featureLayers{curr_layer}, 'OutputAs', 'columns');
    currentActivations_dissPearson=corr(zscore(currentActivations, 0, 2));
    currentActivations_dissPearson_spearman=corr(zscore(currentActivations, 0, 2),'Type','Spearman');
    save(['SaveFile_' num2str(featureLayers{curr_layer})],'currentActivations','currentActivations_dissPearson','currentActivations_dissPearson_spearman','-v7.3')
end


% Permute weights in each layer - run this each iteration
net_orig = alexnet;
layers = net_orig.Layers ;

for l = 1:length(layers)
    if isprop(layers(l), 'Weights') % Does layer l have weights?

        [R,C,RGB,F,G] = size(layers(l).Weights);
        pot = layers(l).Weights(:);
        new_sample = datasample(pot,R*C*RGB*F*G);
        new_weights = reshape(new_sample,[R,C,RGB,F,G]);

        if l == 2
            filters_all = cat(4,layers(l).Weights,new_weights);
            %figure, montage(rescale(filters_all))
        end

        layers(l).Weights = new_weights;

    end

end
assembledNet = assembleNetwork(layers);


