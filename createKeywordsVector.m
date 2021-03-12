function featureVector = createKeywordsVector(keywordsTrain, words)
%createKeywordsVector 
%   create feature vector from MI keywords

featureVector = zeros(length(keywordsTrain),height(words));

for i=1:length(keywordsTrain)
    
    for j=1:height(words)
        recipe = keywordsTrain(i,:);
        currentword = words(j,:).Feature;
        if contains(recipe, currentword)
            featureVector(i,j) = 1;
        else
            featureVector(i,j) = 0;
        end
    end
    
end

end

