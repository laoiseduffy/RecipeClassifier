function accuracy = SVMUsingCombinedFeatures(label)
%SVMUsingCombinedFeatures
%   SVM algorithm using nutritional information and keywords as features

% Load full dataset and top keywords. Refine the table to important features
T = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/final.xlsm', 'TextType', 'string');
topKeywords = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/Top10Keywords.xlsx', 'TextType', 'string');
topLabelKeywords = topKeywords.(label);
keywords = T.keywords;
keywordsFeatureVector = countWordFrequency(keywords, topLabelKeywords);
refinedTable = table(T.kcal, T.fat, T.carbs, T.protein, T.(label));
refinedTable.Properties.VariableNames = { 'kcal' 'fat' 'carbs' 'protein' label};
refinedTable = addvars(refinedTable,keywordsFeatureVector,'Before',(label));

% Split data into training and testing set
cvp = cvpartition(height(refinedTable),'Holdout',0.2);
trainingSet = refinedTable(cvp.training,:);
testingSet = refinedTable(cvp.test,:);

%Train model
SVMModel = fitcsvm(trainingSet,label);

% Use model to predict labels
predictions = predict(SVMModel,testingSet);

% Find accuracy
accuracy = sum(predictions == testingSet.(label))/numel(testingSet.(label));

end

