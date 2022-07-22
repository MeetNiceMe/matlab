function layers = get_alex_net()
layers = [
    imageInputLayer([32 32 1],"Name","imageinput")
    convolution2dLayer([5 5],64,"Name","conv_1","Padding","same")
    reluLayer("Name","relu_1")
    maxPooling2dLayer([3 3],"Name","maxpool_1","Padding","same","Stride",[2 2])
    convolution2dLayer([5 5],64,"Name","conv_2","Padding","same")
    reluLayer("Name","relu_2")
    maxPooling2dLayer([3 3],"Name","maxpool_2","Padding","same","Stride",[2 2])
    convolution2dLayer([3 3],128,"Name","conv_3","Padding","same")
    reluLayer("Name","relu_3")
    convolution2dLayer([3 3],128,"Name","conv_4","Padding","same")
    reluLayer("Name","relu_4")
    convolution2dLayer([3 3],128,"Name","conv_5","Padding","same")
    reluLayer("Name","relu_5")
    batchNormalizationLayer('Name', 'bn3')
    reluLayer('Name', 'relu3')
    dropoutLayer(0.2, 'Name', 'dropout')
    % È«Á¬½Ó
    fullyConnectedLayer(1, 'Name', 'fc')
    regressionLayer('Name', 'output')];


