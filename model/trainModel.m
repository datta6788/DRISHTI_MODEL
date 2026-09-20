% =========================
% M1 DR MODEL TRAINING
% =========================

clear;
clc;

% -------------------------
% 1. Create training datastore
% -------------------------

run("createDatastore.m");

% -------------------------
% 2. Create validation datastore
% -------------------------

run("createValDatastore.m");

% -------------------------
% 3. Prepare model inputs
% -------------------------

run("prepareModelData.m");

% -------------------------
% 4. Create EfficientNet model
% -------------------------

run("modifyNetwork.m");

% -------------------------
% 5. Training options
% -------------------------

run("trainOptions.m");

% -------------------------
% 6. Train model
% -------------------------

[trainedNet, info] = trainnet( ...
    augimdsTrain, ...
    net, ...
    "crossentropy", ...
    options);

% -------------------------
% 7. Save trained model
% -------------------------

save("trainedDRModel.mat", ...
    "trainedNet", ...
    "info");

fprintf("\nTraining completed.\n");
fprintf("Model saved as trainedDRModel.mat\n");