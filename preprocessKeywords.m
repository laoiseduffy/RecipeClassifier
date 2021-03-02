function documents = preprocessKeywords(keywords)
%preprocessKeywords
%   Remove spaces
%   Tokenize the text using tokenizedDocument.
%   Erase punctionation

keywords = strrep(keywords, ' ', ''); 
documents = tokenizedDocument(keywords);
documents = erasePunctuation(documents);

end

