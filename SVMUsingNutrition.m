function accuracy = SVMUsingNutrition(label)
%SVMUsingNutrition 
%   SVM algorithm using nutritional information as features

% Load full dataset and refine it to imprtant features
T = readtable('final.xlsm', 'TextType', 'string');
refinedTable = table(T.kcal, T.fat, T.carbs, T.sugars, T.fibre, T.protein, T.salt, T.(label));
refinedTable.Properties.VariableNames = { 'kcal' 'fat' 'carbs' 'sugars' 'fibre' 'protein' 'salt' label};

% Split data into training and testing set
cvp = cvpartition(height(refinedTable),'Holdout',0.1);
trainingSet = refinedTable(cvp.training,:);
testingSet = refinedTable(cvp.test,:);

%Train model
SVMModel = fitcsvm(trainingSet,label);

% Use model to predict labels
predictions = predict(SVMModel,testingSet);

% Find accuracy
accuracy = sum(predictions == testingSet.(label))/numel(testingSet.(label));


end

