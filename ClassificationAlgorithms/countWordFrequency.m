function features = countWordFrequency(keywordsTrain, topLabelKeywords)
%countWordFrequency
%   Count the frequency of top keywords for each row

features = zeros(length(keywordsTrain),1);

for i = 1:length(keywordsTrain) 
    for j = 1:length(topLabelKeywords)
        if contains(keywordsTrain(i,:), topLabelKeywords(j,:))
            features(i,:) = features(i,:) + 1;
        end
    end
end

end

