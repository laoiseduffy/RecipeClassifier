function [x,y] = avROCValues(label,algorithm)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

totalX1=0;totalX3=0;totalX5=0;totalX7=0;
totalY1=0;totalY3=0;totalY5=0;totalY7=0;
if algorithm == "KNNUsingNutritionAndMI"
    for i=1:5
       [~,~,~,~,~,~,~,X1,Y1] = KNNUsingNutritionAndMI(label,1);
        [~,~,~,~,~,~,~,X3,Y3] = KNNUsingNutritionAndMI(label,3);
        [~,~,~,~,~,~,~,X5,Y5] = KNNUsingNutritionAndMI(label,5);
        [~,~,~,~,~,~,~,X7,Y7] = KNNUsingNutritionAndMI(label,7);
        totalX1=totalX1+X1; totalX3=totalX3+X3; totalX5=totalX5+X5; totalX7=totalX7+X7;
        totalY1=totalY1+Y1; totalY3=totalY3+Y3; totalY5=totalY5+Y5; totalY7=totalY7+Y7; 
    end
elseif algorithm == "KNNUsingNutrition"
    for i=1:5
        [~,~,~,~,~,~,~,X1,Y1] = KNNUsingNutrition(label,1);
        [~,~,~,~,~,~,~,X3,Y3] = KNNUsingNutrition(label,3);
        [~,~,~,~,~,~,~,X5,Y5] = KNNUsingNutrition(label,5);
        [~,~,~,~,~,~,~,X7,Y7] = KNNUsingNutrition(label,7);
        totalX1=totalX1+X1; totalX3=totalX3+X3; totalX5=totalX5+X5; totalX7=totalX7+X7;
        totalY1=totalY1+Y1; totalY3=totalY3+Y3; totalY5=totalY5+Y5; totalY7=totalY7+Y7;
    end
end

avX1 = totalX1/5; avX3 = totalX3/5; avX5 = totalX5/5; avX7 = totalX7/5;
avY1 = totalY1/5; avY3 = totalY3/5; avY5 = totalY5/5; avY7 = totalY7/5;

y = [0, avY7(2,1), avY5(2,1), avY3(2,1), avY1(2,1), 1];
x = [0, avX7(2,1), avX5(2,1), avX3(2,1), avX1(2,1), 1];

end

