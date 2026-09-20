imageFolder = ...
    "D:\SIH2026prototype\DR-Screening\data\train_images";

labels = readtable( ...
    "D:\SIH2026prototype\DR-Screening\data\train_1.csv");

files = dir(fullfile(imageFolder, "*.png"));

fprintf("CSV images   : %d\n", height(labels));
fprintf("Folder images: %d\n", length(files));

missing = 0;

for i = 1:height(labels)

    imageName = labels.id_code{i} + ".png";

    if ~isfile(fullfile(imageFolder, imageName))
        missing = missing + 1;
        fprintf("Missing: %s\n", imageName);
    end

end

fprintf("Missing images: %d\n", missing);