% Load APTOS training labels
labels = readtable( ...
    "D:\SIH2026prototype\DR-Screening\data\train_1.csv");

% Convert diagnosis to categorical
labels.diagnosis = categorical(labels.diagnosis);

% Display first few rows
disp(head(labels));

% Display column names
disp(labels.Properties.VariableNames);

% Count images in each DR grade
disp(groupcounts(labels, "diagnosis"));