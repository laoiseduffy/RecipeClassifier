% Mutual Information Feature Ranking
close all
clear all

% Change this for each label
label = 'recovery';

T = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/final.xlsm', 'TextType', 'string');
totalRecipes = height(T);
totalPosPre = sum(T.(label) == 1);
totalNegPre = sum(T.(label) == 0);

frequencyTable = frequencyTable(label);
% frequencyTable = frequencyTable.rankingTable;

% feature, MIScore
Feature = frequencyTable.words;
MutualInformationScore = zeros(height(Feature),1);
featureRankingTable = table(Feature,MutualInformationScore);

% for each feature, find its score
for i=1:height(frequencyTable)
    feature = frequencyTable.words(i);
    freqPos = frequencyTable.posLabelFrequency(i);
    freqNeg = frequencyTable.negLabelFrequency(i);
    
    MI = MIScore(totalPosPre,totalNegPre,freqPos,freqNeg);
    
    featureRankingTable.MutualInformationScore(i) = MI;
    
end

R = sortrows(featureRankingTable,2,'descend');

indices = find(isnan(R(:,2).MutualInformationScore));
R(indices,:) = [];

