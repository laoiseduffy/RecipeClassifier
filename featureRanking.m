% Mutual Information Feature Ranking
close all
clear all

T = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/final.xlsm', 'TextType', 'string');
totalRecipes = height(T);
totalPosPre = sum(T.pre == 1);
totalNegPre = sum(T.pre == 0);

frequencyTable = load('preKeywordsRanking.mat');
frequencyTable = frequencyTable.rankingTable;

% feature, MIScore
Feature = frequencyTable.words;
MutualInformationScore = zeros(height(Feature),1);
featureRankingTable = table(Feature,MutualInformationScore);

% for each feature, find its score
for i=1:height(frequencyTable)
    feature = frequencyTable.words(i);
    freqPos = frequencyTable.preFrequency(i);
    freqNeg = frequencyTable.notPreFrequency(i);
    
    MI = MIScore(totalPosPre,totalNegPre,freqPos,freqNeg);
    
    featureRankingTable.MutualInformationScore(i) = MI;
    
end

B = sortrows(featureRankingTable,2,'descend');

indices = find(isnan(B(:,2).MutualInformationScore));
B(indices,:) = [];

