clear all
close all

% healthyAccuracy = SVMUsingCombinedFeatures('healthy');

% healthyAccuracyK = SVMUsingFreqKeywords('healthy');

% healthyAccuracyMI = SVMUsingMIKeywords('healthy');
% 
% accuracyOne=0; ErrorRateOne=0; RecallOne=0; PrecisionOne=0; SpecificityOne=0; F1One=0; FalseAlarmRateOne=0;
totalaccuracy=0; totalErrorRate=0; totalRecall=0; totalPrecision=0; totalSpecificity=0; totalF1=0; totalFalseAlarmRate=0;

for i=1:5 
    [accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = SVMUsingNutrition('post'); 
    totalaccuracy = totalaccuracy + accuracy;
    totalErrorRate = totalErrorRate + ErrorRate;
    totalRecall = totalRecall + Recall;
    totalPrecision = totalPrecision + Precision;
    totalSpecificity = totalSpecificity + Specificity;
    totalF1 = totalF1 + F1;
    totalFalseAlarmRate = totalFalseAlarmRate + FalseAlarmRate;
end

accuracyOne = totalaccuracy/5;
ErrorRateOne = totalErrorRate/5; 
RecallOne = totalRecall/5; 
PrecisionOne = totalPrecision/5; 
SpecificityOne = totalSpecificity/5; 
F1One = totalF1/5; 
FalseAlarmRateOne = totalFalseAlarmRate/5;

metricsTable = table(accuracyOne, ErrorRateOne, RecallOne, PrecisionOne, SpecificityOne, F1One, FalseAlarmRateOne);
metricsTable.Properties.VariableNames = {'accuracy' 'ErrorRate' 'Recall' 'Precision' 'Specificity' 'F1' 'FalseAlarmRate'};

totalaccuracy=0; totalErrorRate=0; totalRecall=0; totalPrecision=0; totalSpecificity=0; totalF1=0; totalFalseAlarmRate=0;

for i=1:5 
    [accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = SVMUsingNutritionAndMI('post'); 
    totalaccuracy = totalaccuracy + accuracy;
    totalErrorRate = totalErrorRate + ErrorRate;
    totalRecall = totalRecall + Recall;
    totalPrecision = totalPrecision + Precision;
    totalSpecificity = totalSpecificity + Specificity;
    totalF1 = totalF1 + F1;
    totalFalseAlarmRate = totalFalseAlarmRate + FalseAlarmRate;
end

accuracyTwo = totalaccuracy/5;
ErrorRateTwo = totalErrorRate/5; 
RecallTwo = totalRecall/5; 
PrecisionTwo = totalPrecision/5; 
SpecificityTwo = totalSpecificity/5; 
F1Two = totalF1/5; 
FalseAlarmRateTwo = totalFalseAlarmRate/5;

newRow = {accuracyTwo, ErrorRateTwo, RecallTwo, PrecisionTwo, SpecificityTwo, F1Two, FalseAlarmRateTwo;};
metricsTable = [metricsTable; newRow]

