% Unit Tests

function tests = UnitTests
tests = functiontests(localfunctions);
end

function testRealSolution(testCase)
actual = round(MIScore(1000,1000,353,202),2);
expected = 0.02;
verifyEqual(testCase, actual, expected)
end

function testCountWordFrequency(testCase)
keywordsTrain1 = "healthy, chicken, mexican";
keywordsTrain2 = "hello, dessert, cake";
keywordsTrain3 = "healthy, salad";
keywordsTrain = [keywordsTrain1; keywordsTrain2; keywordsTrain3];
topKeywords = ["healthy"; "salad"];
actual = countWordFrequency(keywordsTrain, topKeywords);
expected = [1;0;2];
verifyEqual(testCase, actual, expected)
end

function testCreateKeywordsVector(testCase)
keywordsTrain1 = "Healthy, Chicken, mexican";
keywordsTrain2 = "hello, Dessert, cake";
keywordsTrain3 = "healthy, salad, Fish";
keywordsTrain = [keywordsTrain1; keywordsTrain2; keywordsTrain3];
words = load('HealthyMIScores.mat').H;
words = head(words,10);
actual = createKeywordsVector(keywordsTrain, words);
vector1 = [1 0 0 0 0 0 0 0 0 0];
vector2 = [0 0 0 1 0 0 0 0 0 0];
vector3 = [0 0 0 0 0 0 0 0 0 1];
expected = [vector1; vector2; vector3];
verifyEqual(testCase, actual, expected)
end

function testEvaluationValues(testCase)
[Accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = evaluationValues(2, 195, 2, 1, 200);
expectedAccuracy = 0.985;
verifyEqual(testCase, Accuracy, expectedAccuracy);
verifyEqual(testCase, round(Recall,2), 0.67);
verifyEqual(testCase, round(F1,2), 0.57)
end

function testEvaluationValues2(testCase)
[Accuracy,ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = evaluationValues(5, 4, 1, 0, 10);
expectedAccuracy = 0.9;
verifyEqual(testCase, Accuracy, expectedAccuracy)
end

function testMetrics(testCase)
labels = [1;1;1;1;1;0;0;0;0;0];
classificationResults = [1;1;1;1;1;0;0;0;0;1];
[ErrorRate,Recall,Precision,Specificity,F1,FalseAlarmRate] = metrics(labels,classificationResults);
verifyEqual(testCase, ErrorRate, 0.1)
end




