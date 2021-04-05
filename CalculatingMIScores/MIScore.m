function MI = MIScore(totalPos,totalNeg,freqPos,freqNeg)
%MIScore Mutual Information Score
%   Feature Ranking

totalSample = totalNeg + totalPos;

% occurs
probOccurs = (freqNeg+freqPos)/totalSample;
    bWhenOccurs = freqNeg/ (freqNeg+freqPos);
    probB = totalNeg/ (totalNeg+totalPos);
    sum1 = probOccurs * bWhenOccurs * log2(bWhenOccurs/probB);
    mWhenOccurs = freqPos/(freqNeg+freqPos);
    probM = totalPos/(totalNeg+totalPos);
    sum2 = probOccurs * mWhenOccurs * log2(mWhenOccurs/probM);

% does not occur
probNotOccur = (totalSample-(freqNeg+freqPos))/totalSample;
    bWhenNotOccur = (totalNeg-freqNeg)/((totalNeg-freqNeg)+(totalPos-freqPos));
    sum3 = probNotOccur * bWhenNotOccur * log2(bWhenNotOccur/probB);
    mWhenNotOccur = (totalPos-freqPos)/((totalPos-freqPos)+(totalNeg-freqNeg));
    sum4 = probNotOccur * mWhenNotOccur * log2(mWhenNotOccur/probM);
    
MI = sum1+sum2+sum3+sum4;

end

