function layers = get_self_net(image_size)
layers = [
    imageInputLayer(image_size, 'Name', 'data')
    convolution2dLayer(3,8,'Padding','same', 'Name', 'cnn1')
    batchNormalizationLayer('Name', 'bn1')
    reluLayer('Name', 'relu1')
    maxPooling2dLayer(2,'Stride',2, 'Name', 'pool1')
    convolution2dLayer(3,16,'Padding','same', 'Name', 'cnn2')
    batchNormalizationLayer('Name', 'bn2')
    reluLayer('Name', 'relu2')
    maxPooling2dLayer(2,'Stride',2, 'Name', 'pool2')
    convolution2dLayer(3,32,'Padding','same', 'Name', 'cnn3')
    batchNormalizationLayer('Name', 'bn3')
    reluLayer('Name', 'relu3')
    dropoutLayer(0.2, 'Name', 'dropout')
    fullyConnectedLayer(1, 'Name', 'fc')
    regressionLayer('Name', 'output')];
