function [BitStringInUint8, SymCodeTable] = HuffEncode(SymString)

% ------------------------------------------------------------------------
% To Use Huffman Method to encode the input string of symbols
% ---
% Input:
%     SymString - the input string of symbols
% Output:
%     BitString - the encoded data, in uint8 type
%     SymCodeTable - cell of sym and code, code is a cell of uint8 vectors
% ------------------------------------------------------------------------

SymCodeTable = getSymCodeTable(SymString);

BitStringInUint8 = [];
Symbol = SymCodeTable{1};
Code = SymCodeTable{2};

for i = 1:length(SymString)
    BitStringInUint8 = [BitStringInUint8, Code{Symbol == SymString(i)}];
end

return