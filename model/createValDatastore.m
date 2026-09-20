imageFolder = ...
    "D:\SIH2026prototype\DR-Screening\data\val_images";

labelFile = ...
    "D:\SIH2026prototype\DR-Screening\data\valid.csv";

labels = readtable(labelFile);

labels.diagnosis = categorical(labels.diagnosis);

% Create validation datastore
valImds = imageDatastore(imageFolder);

% Get filenames
imageNames = string(valImds.Files);

imageNames = extractAfter( ...
    imageNames, ...
    strlength(imageFolder) + 1);

imageNames = erase(imageNames, ".png");

% Match labels
[~, order] = ismember( ...
    imageNames, ...
    string(labels.id_code));

% Assign labels
valImds.Labels = labels.diagnosis;

valImds.Labels = labels.diagnosis(order);

disp(valImds);
disp(countEachLabel(valImds));