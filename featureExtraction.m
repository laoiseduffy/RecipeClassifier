function features = featureExtraction(T,label)
%featureExtraction 
%   extraction features for nutrition and MI score

% get words for label
if label == "pre"
    words = load('PreMIScores.mat').B;
elseif label == "healthy"
    words = load('HealthyMIScores.mat').H;
elseif label == "post"
    words = load('PostMIScore.mat').P;
else 
    words = load('RecoveryMIScores.mat').R;
end
words = head(words,10);

keywords = T.keywords;
featureVector = createKeywordsVector(keywords, words);
features = table(T.kcal, T.fat, T.carbs, T.protein, featureVector(:,1), featureVector(:,2), featureVector(:,3), featureVector(:,4), featureVector(:,5), featureVector(:,6), featureVector(:,7), featureVector(:,8), featureVector(:,9), featureVector(:,10));

end

