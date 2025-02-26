function train_model()
    % Load dataset
    data = load('timing_data.mat'); 
    X = data.featureMatrix;  % Load the correct variable % Feature matrix (Nx8)
    Y = data.labels; % Use 'label' instead of 'labels' (since we saved one value % Target (timing violations)

    % Ensure Y is a column vector (Nx1)
    Y = Y(:);

    % Check input feature size
    numFeatures = size(X, 2);
    disp(['Training with ', num2str(numFeatures), ' features.']);

    % Split dataset into training & testing sets
  if size(X,1) > 1
    cv = cvpartition(size(X,1), 'HoldOut', 0.3);
    X_train = X(training(cv,1),:);
    Y_train = Y(training(cv,1),:);
    X_test = X(test(cv,1),:);
    Y_test = Y(test(cv,1),:);
else
    % Not enough data for splitting, so train on the full dataset
    X_train = X;
    Y_train = Y;
    X_test = X;  % No separate test set
    Y_test = Y;
    disp('⚠️ Warning: Only one sample available. Training on the full dataset.');
end


    % Define Deep Learning model
    layers = [
        featureInputLayer(numFeatures, 'Normalization', 'none') % Match feature size
        fullyConnectedLayer(16)
        reluLayer
        fullyConnectedLayer(8)
        reluLayer
        fullyConnectedLayer(1)
        regressionLayer
    ];

    % Train the model
    options = trainingOptions('adam', ...
        'MaxEpochs', 100, ...
        'Verbose', false, ...
        'Shuffle', 'every-epoch', ...
        'MiniBatchSize', 8);

    net = trainNetwork(X_train, Y_train, layers, options);

    % Create a struct to store the model and prediction function
    trainedModel.net = net;
    
    % Fix the predict function (Ensuring single-row input format)
    trainedModel.predictFcn = @(features) predict(net, features);  

    % Save the trained model
    save('trainedModel.mat', 'trainedModel');
    
    % Evaluate model
    predicted_depth = predict(net, X_test);
    mse = mean((predicted_depth - Y_test).^2);
    disp(['Mean Squared Error: ', num2str(mse)]);
end
