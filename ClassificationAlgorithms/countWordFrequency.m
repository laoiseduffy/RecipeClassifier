function features = countWordFrequency(keywordsTrain, topLabelKeywords)
%countWordFrequency
%   Count the frequency of top keywords for each row

features = zeros(length(keywordsTrain),1);

for i = 1:length(keywordsTrain) 
    for j = 1:length(topLabelKeywords)
%         str = keywordsTrain(i,:);
%         k = strfind(str, topLabelKeywords(j,:));
%         if ~isempty(k)
%             features(i,:) = features(i,:) + 1;
%         end
        if contains(keywordsTrain(i,:), topLabelKeywords(j,:))
            features(i,:) = features(i,:) + 1;
        end
    end
end

end

