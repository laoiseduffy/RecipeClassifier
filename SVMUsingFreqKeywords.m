function accuracy = SVMUsingFreqKeywords(label)
%SVMUsingKeywords Summary of this function goes here
%   SVM algorithm using bag of keywords as feature

% Load the dataset
T = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/final.xlsm', 'TextType', 'string');
topKeywords = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/Top10Keywords.xlsx', 'TextType', 'string');
topLabelKeywords = topKeywords.(label);

% Split the data into training and testing sets
cvp = cvpartition(T.(label),'Holdout',0.2);
trainingSet = T(cvp.training,:);
testingSet = T(cvp.test,:);

% Seperate out the keywords and labels
keywordsTrain = trainingSet.keywords;
keywordsTest = testingSet.keywords;
trainingLabels = trainingSet.(label);
testingLabels = testingSet.(label);

% Create a feature vector from the keywords
keywordFeatureVector = countWordFrequency(keywordsTrain, topLabelKeywords);

SVMModel = fitcsvm(keywordFeatureVector,trainingLabels);

% Use model to predict labels
keywordTestFeatureVector = countWordFrequency(keywordsTest, topLabelKeywords);
predictions = predict(SVMModel,keywordTestFeatureVector);

[ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = metrics(testingLabels,predictions);
% Use the model to predict the labels and measure the accuracy
accuracy = sum(predictions == testingLabels)/numel(testingLabels);

% Display metrics
keywordsTable = table(accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate, 'VariableNames',{'Accuracy','ErrorRate','Recall','Precision','Specificity','F1','FalseAlarmRate'})
% confusionMatrix(testLabels,classificationResult);

end

