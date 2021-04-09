function [accuracyAv,ErrorRateAv,RecallAv,PrecisionAv,SpecificityAv,F1Av,FalseAlarmRateAv] = averageMetrics(algorithm, label)
%averageMetrics Summary of this function goes here
%   Detailed explanation goes here
% algorithm1 = SVM Using Nutrition
% algorithm2 = SVM Using Nutrition and MI
% algorithm3 = KNN Using Nutrition
% algorithm4 = KNN Using Nutrition and MI

totalaccuracy=0; totalErrorRate=0; totalRecall=0; totalPrecision=0; totalSpecificity=0; totalF1=0; totalFalseAlarmRate=0;

for i=1:5
    if algorithm == 1
        [accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = SVMUsingNutrition(label); 
    elseif algorithm == 2
        [accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = SVMUsingNutritionAndMI(label);
    elseif algorithm == 3
        [accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = KNNUsingNutrition(label, K);
    else
        [accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = KNNUsingNutritionAndMI(label);
    end
    totalaccuracy = totalaccuracy + accuracy;
    totalErrorRate = totalErrorRate + ErrorRate;
    totalRecall = totalRecall + Recall;
    totalPrecision = totalPrecision + Precision;
    totalSpecificity = totalSpecificity + Specificity;
    totalF1 = totalF1 + F1;
    totalFalseAlarmRate = totalFalseAlarmRate + FalseAlarmRate;
end

accuracyAv = totalaccuracy/5;
ErrorRateAv = totalErrorRate/5; 
RecallAv = totalRecall/5; 
PrecisionAv = totalPrecision/5; 
SpecificityAv = totalSpecificity/5; 
F1Av = totalF1/5; 
FalseAlarmRateAv = totalFalseAlarmRate/5;

end

