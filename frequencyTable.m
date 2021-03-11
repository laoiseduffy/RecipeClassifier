function rankingTable = frequencyTable(label)
%frequencyTable 
%   Create a table of the frequency of keywords for a label

% get the keywords bag of words 
keywords = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/keywordsBoW.xlsx', 'TextType', 'string');
T = readtable('/Users/laoiseduffy/Documents/Final Year/CSC3002/Data/final.xlsm', 'TextType', 'string');

height(keywords);
posLabelFrequency = zeros(height(keywords),1);
negLabelFrequency = zeros(height(keywords),1);
words = keywords.Word;
rankingTable = table(words,posLabelFrequency,negLabelFrequency);

for i=1:height(keywords)
    currentWord = strtrim(keywords.Word(i));
    negFreq = 0;
    posFreq = 0;
    for j=1:height(T)
        currentRow = T(j,:);
        if contains(currentRow.keywords, currentWord)
            if currentRow.(label) == 0
                negFreq = negFreq+1;
            else
                posFreq = posFreq+1;
            end
        end
    end
    rankingTable.posLabelFrequency(i) = posFreq;
    rankingTable.negLabelFrequency(i) = negFreq;
end

end

