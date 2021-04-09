% Parameter Tuning

close all;
clear all;

% Creates a ROC Curve to find out which value would be the best to set K to

[x,y] = avROCValues("healthy","KNNUsingNutritionAndMI");

figure()
plot(x,y,'o-')
xlim([0 1])
ylim([0 1])
xlabel('False Positive Rate')
ylabel('True Positive Rate')
title('Healthy ROC Curve')
% best is X = 0.052, Y=0.859 which is K=1

[x,y] = avROCValues("post","KNNUsingNutrition");

figure()
plot(x,y,'o-')
xlim([0 1])
ylim([0 1])
xlabel('False Positive Rate')
ylabel('True Positive Rate')
title('Post ROC Curve')

% best is X=0.064, Y=0.702 which is K=5

