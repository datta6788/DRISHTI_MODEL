function loss = weightedLoss(Y,T)

    % Class weights for Grades 0-4
    weights = [0.409 1.953 0.725 3.805 2.504];

    % Convert labels to numeric indices
    T = double(T);

    % Get the weight corresponding to each true class
    sampleWeights = weights(T);

    % Cross-entropy for each sample
    ce = -sum(T .* log(Y + eps), 2);

    % Apply class weights
    loss = mean(sampleWeights .* ce);

end