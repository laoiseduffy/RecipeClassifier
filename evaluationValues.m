function [Accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = evaluationValues(TP, TN, FP, FN, N)

Accuracy = TP/N;
ErrorRate = (FN+FP)/N;
Recall = TP/(TP+FN);
Precision = TP/(TP+FP);
Specificity = TN/(TN+FP);
F1 = 2*(Precision*Recall)/(Precision+Recall);
FalseAlarmRate = 1-Specificity;

end
