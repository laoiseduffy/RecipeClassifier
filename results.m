close all
clear all

% Average metrics for each model / feature combination

label = 'recovery';

%SVM Using Nutrition
[accuracyAv,ErrorRateAv,RecallAv,PrecisionAv,SpecificityAv,F1Av,FalseAlarmRateAv] = averageMetrics(1, label);
metricsTable = table(accuracyAv, ErrorRateAv, RecallAv, PrecisionAv, SpecificityAv, F1Av, FalseAlarmRateAv);
metricsTable.Properties.VariableNames = {'accuracy' 'ErrorRate' 'Recall' 'Precision' 'Specificity' 'F1' 'FalseAlarmRate'};

% SVM Using Nutrition and MI
[accuracyAv2,ErrorRateAv2,RecallAv2,PrecisionAv2,SpecificityAv2,F1Av2,FalseAlarmRateAv2] = averageMetrics(2, label);
newRow = {accuracyAv2,ErrorRateAv2,RecallAv2,PrecisionAv2,SpecificityAv2,F1Av2,FalseAlarmRateAv2;};
metricsTable = [metricsTable; newRow];

% KNN Using Nutrition
[accuracyAv3,ErrorRateAv3,RecallAv3,PrecisionAv3,SpecificityAv3,F1Av3,FalseAlarmRateAv3] = averageMetrics(3, label);
newRow = {accuracyAv3,ErrorRateAv3,RecallAv3,PrecisionAv3,SpecificityAv3,F1Av3,FalseAlarmRateAv3;};
metricsTable = [metricsTable; newRow];

% KNN Using Nutrition and MI
[accuracyAv4,ErrorRateAv4,RecallAv4,PrecisionAv4,SpecificityAv4,F1Av4,FalseAlarmRateAv4] = averageMetrics(4, label);
newRow = {accuracyAv4,ErrorRateAv4,RecallAv4,PrecisionAv4,SpecificityAv4,F1Av4,FalseAlarmRateAv4;};
metricsTable = [metricsTable; newRow]