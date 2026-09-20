inputSize = [224 224 3];

% Make the training datastore return fixed-size images
imds.ReadFcn = @(filename) ...
    imresize(imread(filename), [224 224]);

% Make the validation datastore return fixed-size images
valImds.ReadFcn = @(filename) ...
    imresize(imread(filename), [224 224]);

% Use the original image datastores directly
augimdsTrain = imds;
augimdsVal = valImds;

fprintf("Training images   : %d\n", numel(imds.Files));
fprintf("Validation images : %d\n", numel(valImds.Files));