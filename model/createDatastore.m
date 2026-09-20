imageFolder = ...
    "D:\SIH2026prototype\DR-Screening\data\train_images";

labelFile = ...
    "D:\SIH2026prototype\DR-Screening\data\train_1.csv";

labels = readtable(labelFile);

labels.diagnosis = categorical(labels.diagnosis);

% Create image datastore
imds = imageDatastore(imageFolder);

% Get filenames
imageNames = string(imds.Files);

imageNames = extractAfter( ...
    imageNames, ...
    strlength(imageFolder) + 1);

imageNames = erase(imageNames, ".png");

% Match images with labels
[~, order] = ismember( ...
    imageNames, ...
    string(labels.id_code));

% Assign labels
imds.Labels = labels.diagnosis(order);

disp(imds);
disp(countEachLabel(imds));