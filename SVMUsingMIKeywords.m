function accuracy = SVMUsingMIKeywords(label)
%SVMUsingMIKeywords Summary of this function goes here
%   SVM using most relevant keywords as defined by MI scores

% Load the dataset
T = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/final.xlsm', 'TextType', 'string');

% get words for label
if label == "pre"
    words = load('PreMIScores.mat').B;
elseif label == "healthy"
    words = load('HealthyMIScores.mat').H;
elseif label == "post"
    words = load('PostMIScore.mat').P;
else 
    words = load('RecoveryMIScores.mat').R;
end
words = head(words,10);

% Split the data into training and testing sets
cvp = cvpartition(T.(label),'Holdout',0.2);
trainingSet = T(cvp.training,:);
testingSet = T(cvp.test,:);

% Seperate out the keywords and labels
keywordsTrain = trainingSet.keywords;
keywordsTest = testingSet.keywords;
trainingLabels = trainingSet.(label);
testingLabels = testingSet.(label);

featureVector = createKeywordsVector(keywordsTrain, words);

SVMModel = fitcsvm(featureVector,trainingLabels);

% Use model to predict labels
featureVectorTest = createKeywordsVector(keywordsTest, words);
predictions = predict(SVMModel,featureVectorTest);

[ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = metrics(testingLabels,predictions);
% Use the model to predict the labels and measure the accuracy
accuracy = sum(predictions == testingLabels)/numel(testingLabels);

% Display metrics
MIKeywordsTable = table(accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate, 'VariableNames',{'Accuracy','ErrorRate','Recall','Precision','Specificity','F1','FalseAlarmRate'})
% confusionMatrix(testLabels,classificationResult);

end

