function [ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = metrics(labels,classificationResults)

TP=0;
FP=0;
FN=0;
TN=0;

for i=1:length(labels)
    if labels(i,:) == 1
        if classificationResults(i,:) == 1
            TP = TP+1;
        else
            FN = FN+1;
        end
    else
        if classificationResults(i,:) == 1
            FP = FP+1;
        else
            TN=TN+1;
        end
    end
end
N = length(labels);
[~,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = evaluationValues(TP, TN, FP, FN, N);

end

