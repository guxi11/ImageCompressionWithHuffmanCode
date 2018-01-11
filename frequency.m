function [X, Pdfx] = frequency(data)  

% ------------------------------------------------------------------------
% Calculate the frequency of values of X
% Input:
%     data -  
% Output:
%     X - the values, a double vector
%     Pdfx - the pdfs of values in X respectively, a double vector
% ------------------------------------------------------------------------

X = unique(data);
len = length(X);
Pdfx = zeros(1,len);
for i=1:len
    Pdfx(i) = sum(data == X(i));
end
Pdfx = Pdfx./length(data);

return