clear all
close all

% Classify PRE recipes
% SVM Using Nutrition

T = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/meals.csv', 'TextType', 'string');
refinedTable = table(T.kcal, T.fat, T.carbs, T.sugars, T.fibre, T.protein, T.salt);
refinedTable.Properties.VariableNames = { 'kcal' 'fat' 'carbs' 'sugars' 'fibre' 'protein' 'salt'};
finalTable = table(T.mealid);

% load the svm model

% run it on the table

% get the prediction results
% add a new column to the final table and add the results
