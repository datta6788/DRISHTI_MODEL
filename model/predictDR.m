function [predictedGrade, confidence, referableDR] = ...
    predictDR(processedImage)

    % Load trained model
    persistent trainedNet

    if isempty(trainedNet)
        data = load("trainedDRModel.mat");
        trainedNet = data.trainedNet;
    end

    % EfficientNet input size
    image = imresize(processedImage, [224 224]);

    % Make sure image has 3 channels
    if size(image,3) == 1
        image = repmat(image, [1 1 3]);
    end

    % Convert image to single
    image = single(image);

    % % Normalize
    % image = image / 255;

    % Predict
    scores = predict(trainedNet, image);

    % Find highest probability
    [confidence, index] = max(scores);

    % Convert class index to DR grade
    predictedGrade = index - 1;

    % Referable DR = Grade 2, 3 or 4
    if predictedGrade >= 2
        referableDR = "Yes";
    else
        referableDR = "No";
    end

end