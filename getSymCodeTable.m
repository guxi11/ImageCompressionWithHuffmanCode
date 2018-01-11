function SymCodeTable = getSymCodeTable(SymString)

% ------------------------------------------------------------------------
% To Use Huffman Method to encode the input string of symbols
% ---
% Input:
%     SymString - the input string of symbols
% Output:
%     BitString - the encoded data, in uint8 type
%     SymCodeTable - symbol code table, code is a uint8 vector
% ---
% Rerference:
%     吴记群,李双科.Matlab下实现huffman编码[J].中国科技信息,2006(19):122-123.
% ------------------------------------------------------------------------

[X, Pdfx] = frequency(SymString);

[f, idx] = sort(Pdfx, 'descend');

A = idx + f.*i;
B = sort(idx) + f.*i;
C = [];

n = length(X);
n = n-1;  % the Figure in the assay might be wrong, n should minus 1 before the next step.
while(n > 0)
    [Bimag, Bidx] = sort(imag(B));
    Bsorted = B(Bidx);
    m1 = Bsorted(2);
    m2 = Bsorted(1);
    c1 = real(m1);
    c2 = real(m2);
    C = [C, c1, c2];
    
    B(real(B) == c1) = c1 + (imag(m1) + imag(m2))*i;
    B(real(B) == c2) = c2 + 5i;
    
    n = n - 1;
end
t = length(C);
index = t - 1;
n = length(X);
M = cell(1, n);
while(index > 0)
    index = index - 1;
    while (mod(index, 2) ~= 0)
        index = index - 1;
    end
    index1 = index + 1;
    M{C(index1+1)} = [M{C(index1)}, 0];
    M{C(index1)} = [M{C(index1)}, 1];
end

SymCodeTable = {real(A); M};

return