function [accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = SVMUsingNutrition(label)
%SVMUsingNutrition 
%   SVM algorithm using nutritional information as features

% Load full dataset and refine it to imprtant features
T = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/final.xlsm', 'TextType', 'string');
refinedTable = table(T.kcal, T.fat, T.carbs, T.sugars, T.fibre, T.protein, T.salt, T.(label));
refinedTable.Properties.VariableNames = { 'kcal' 'fat' 'carbs' 'sugars' 'fibre' 'protein' 'salt' label};

% Split data into training and testing set
cvp = cvpartition(height(refinedTable),'Holdout',0.2);
trainingSet = refinedTable(cvp.training,:);
testingSet = refinedTable(cvp.test,:);
% trainingLabels = trainingSet(:,8);
% testingLabels = testingSet(:,8);

%Train model
SVMPreModel = fitcsvm(trainingSet,label);

save SVMPreModel SVMPreModel;

% Use model to predict labels
predictions = predict(SVMPreModel,testingSet);

[ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = metrics(testingSet.(label),predictions);
% Find accuracy
accuracy = sum(predictions == testingSet.(label))/numel(testingSet.(label));

% Display metrics
nutritionTable = table(accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate, 'VariableNames',{'Accuracy','ErrorRate','Recall','Precision','Specificity','F1','FalseAlarmRate'});
% confusionMatrix(testLabels,classificationResult);

end

