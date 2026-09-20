% Load pretrained EfficientNet-B0
net = efficientnetb0;

% Convert to layer graph
lgraph = layerGraph(net);

% Remove original ImageNet output layers
lgraph = removeLayers(lgraph, ...
    ["classification", "Softmax"]);

% Create new 5-class output
newLayers = [
    fullyConnectedLayer(5, ...
        "Name", "dr_fc", ...
        "WeightLearnRateFactor", 10, ...
        "BiasLearnRateFactor", 10)

    softmaxLayer("Name", "dr_softmax")
];

% Replace original fully connected layer
lgraph = replaceLayer( ...
    lgraph, ...
    "efficientnet-b0|model|head|dense|MatMul", ...
    newLayers(1));

% Add softmax
lgraph = addLayers( ...
    lgraph, ...
    newLayers(2));

% Connect layers
lgraph = connectLayers( ...
    lgraph, ...
    "dr_fc", ...
    "dr_softmax");

% Convert to dlnetwork
net = dlnetwork(lgraph);

disp(lgraph.Layers(end-5:end));