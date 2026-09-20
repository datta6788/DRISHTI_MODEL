% Training class counts
classCounts = [1434 300 808 154 234];

% Total number of training images
totalImages = sum(classCounts);

% Number of classes
numClasses = numel(classCounts);

% Calculate balanced class weights
classWeights = totalImages ./ (numClasses .* classCounts);

% Display results
fprintf("Class weights:\n");

for i = 1:numClasses
    fprintf("Grade %d: %.3f\n", i-1, classWeights(i));
end