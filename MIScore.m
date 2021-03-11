function MI = MIScore(totalPos,totalNeg,freqPos,freqNeg)
%MIScore Mutual Information Score
%   Feature Ranking

% B = neg
% M = pos
% totalNeg = 1000;
% totalPos = 1000;
totalSample = totalNeg + totalPos;

% freqNeg = 202;
% freqPos = 353;

% r = 1
% occurs
probOccurs = (freqNeg+freqPos)/totalSample;
    % c = B
    bWhenOccurs = freqNeg/ (freqNeg+freqPos);
    probB = totalNeg/ (totalNeg+totalPos);
    sum1 = probOccurs * bWhenOccurs * log2(bWhenOccurs/probB);
    % c = M
    mWhenOccurs = freqPos/(freqNeg+freqPos);
    probM = totalPos/(totalNeg+totalPos);
    sum2 = probOccurs * mWhenOccurs * log2(mWhenOccurs/probM);
    
% r = 0
% does not occur
probNotOccur = (totalSample-(freqNeg+freqPos))/totalSample;
    % c = B
    bWhenNotOccur = (totalNeg-freqNeg)/((totalNeg-freqNeg)+(totalPos-freqPos));
    sum3 = probNotOccur * bWhenNotOccur * log2(bWhenNotOccur/probB);
    % c = M
    mWhenNotOccur = (totalPos-freqPos)/((totalPos-freqPos)+(totalNeg-freqNeg));
    sum4 = probNotOccur * mWhenNotOccur * log2(mWhenNotOccur/probM);
    
MI = sum1+sum2+sum3+sum4;

end

