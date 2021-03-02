function accuracy = SVMUsingFreqKeywords(label)
%SVMUsingKeywords Summary of this function goes here
%   SVM algorithm using bag of keywords as feature

% Load the dataset
T = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/final.xlsm', 'TextType', 'string');
topKeywords = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/Top10Keywords.xlsx', 'TextType', 'string');
topLabelKeywords = topKeywords.(label);

% Split the data into training and testing sets
cvp = cvpartition(T.(label),'Holdout',0.1);
trainingSet = T(cvp.training,:);
testingSet = T(cvp.test,:);

% Seperate out the keywords and labels
keywordsTrain = trainingSet.keywords;
keywordsTest = testingSet.keywords;
trainingLabels = trainingSet.(label);
testingLabels = testingSet.(label);

keywordsTrain = preprocessKeywords(keywordsTrain);
keywordsTrain(1:10)
topLabelKeywords = preprocessKeywords(topLabelKeywords)
kewordFeatureVector = countWordFrequency(keywordsTrain, topLabelKeywords);

% encKeywords = onehotencode(keywordsTrain, 1, "ClassNames", topLabelKeywords)

% Use the sparse matrix as a feature for the algorithm
% SVMModel = fitcecoc(trainingFeatures,trainingLabels,'Learners','linear');
SVMModel = fitclinear(trainingFeatures,trainingLabels);
% SVMModel = fitcecoc(trainingFeatures,trainingLabels); //doesnt work bc
% training features is a sparse matrix


% Encode the test keywords as a matrix of word frequency counts according
% to the keywords Bag Of Words
keywordsTest = preprocessKeywords(keywordsTest);
TestKeywordsMatrix = encode(keywordsBoW,keywordsTest);

% Use the model to predict the labels and measure the accuracy
predictions = predict(SVMModel,TestKeywordsMatrix);
accuracy = sum(predictions == testingLabels)/numel(testingLabels);

end

