clear all
close all

meals = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/meals.csv', 'TextType', 'string');
featureTable = table(meals.kcal, meals.fat, meals.carbs, meals.sugars, meals.fibre, meals.protein, meals.salt);
featureTable.Properties.VariableNames = { 'kcal' 'fat' 'carbs' 'sugars' 'fibre' 'protein' 'salt'};
finalTable = table(meals.mealid);

% Classify PRE recipes
% SVM Using Nutrition
label = 'pre';
load SVMPreModel;
pre = predict(SVMPreModel,featureTable);
finalTable = addvars(finalTable, pre);

% Classify POST recipes
% KNN Using Nutrition
label = 'post';
KNNUsingNutrition(label);
load KNNPostModel;
post = predict(KNNPostModel, featureTable);
finalTable = addvars(finalTable, post);

% Classify Recovery recipes
% SVM Using Nutrition and MI
label = 'recovery';
SVMUsingNutritionAndMI(label);
load SVMRecoveryModel;
features = featureExtraction(meals,label);
recovery = predict(SVMRecoveryModel, features);
finalTable = addvars(finalTable, recovery);

% Classify Healthy Recipes
% KNN Using Nutrition and MI
label = 'healthy';
KNNUsingNutritionAndMI(label);
load KNNHealthyModel;
features = featureExtraction(meals,label);
healthy = predict(KNNHealthyModel, features);
finalTable = addvars(finalTable, healthy);

head(finalTable,15);
