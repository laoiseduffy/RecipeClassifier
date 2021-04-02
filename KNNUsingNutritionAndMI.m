function [accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = KNNUsingNutritionAndMI(label)
%KNNUsingNutritionAndMI 
%   KNN classifier with nutritional information and Mutual Information 
%       ranked keywords as features

%% Initialization
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

% Labels
trainingLabels = trainingSet.(label);
testingLabels = testingSet.(label);


%% Train

% Keywords feature vector
keywordsTrain = trainingSet.keywords;
featureVector = createKeywordsVector(keywordsTrain, words);


% r = A(:,3)
trainingFeatures = table(trainingSet.kcal, trainingSet.fat, trainingSet.carbs, trainingSet.protein, featureVector(:,1), featureVector(:,2), featureVector(:,3), featureVector(:,4), featureVector(:,5), featureVector(:,6), featureVector(:,7), featureVector(:,8), featureVector(:,9), featureVector(:,10));

KNNHealthyModel = fitcknn(trainingFeatures,trainingLabels);
save KNNHealthyModel;

%% Test

% Keywords feature vector, test
keywordsTest = testingSet.keywords;
featureVectorTest = createKeywordsVector(keywordsTest, words);

trainingFeatures = table(testingSet.kcal, testingSet.fat, testingSet.carbs, testingSet.protein, featureVectorTest(:,1), featureVectorTest(:,2), featureVectorTest(:,3), featureVectorTest(:,4), featureVectorTest(:,5), featureVectorTest(:,6), featureVectorTest(:,7), featureVectorTest(:,8), featureVectorTest(:,9), featureVectorTest(:,10));

% Use model to predict labels
predictions = predict(KNNHealthyModel,trainingFeatures);


%% Evaluation
[ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = metrics(testingLabels,predictions);
% Use the model to predict the labels and measure the accuracy
accuracy = sum(predictions == testingLabels)/numel(testingLabels);

% Display metrics
NutritionAndMITable = table(accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate, 'VariableNames',{'Accuracy','ErrorRate','Recall','Precision','Specificity','F1','FalseAlarmRate'});
% confusionMatrix(testLabels,classificationResult);


end



