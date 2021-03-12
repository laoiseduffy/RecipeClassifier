clear all
close all

healthyAccuracy = SVMUsingCombinedFeatures('healthy');

healthyAccuracyK = SVMUsingFreqKeywords('healthy');

healthyAccuracyN = SVMUsingNutrition('healthy');

healthyAccuracyMI = SVMUsingMIKeywords('healthy');
