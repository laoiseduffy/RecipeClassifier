close all
clear all 

% get the keywords bag of words 
keywords = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/keywordsBoW.xlsx', 'TextType', 'string');
T = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/final.xlsm', 'TextType', 'string');

% for each keyword

% find how many times it occurs in a recipe labelled pre
height(keywords)
preFrequency = zeros(height(keywords),1);
notPreFrequency = zeros(height(keywords),1);
words = keywords.Word;
rankingTable = table(words,preFrequency,notPreFrequency);

for i=1:height(keywords)
    currentWord = strtrim(keywords.Word(i))
    negFreq = 0;
    posFreq = 0;
    for j=1:height(T)
        currentRow = T(j,:);
        if contains(currentRow.keywords, currentWord)
            if currentRow.pre == 0
                negFreq = negFreq+1;
            else
                posFreq = posFreq+1;
            end
        end
    end
    rankingTable.preFrequency(i) = posFreq;
    rankingTable.notPreFrequency(i) = negFreq;
end

