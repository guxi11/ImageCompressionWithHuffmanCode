function [BitStringInUint8, SymCodeTable] = HuffEncode(SymString)

% ------------------------------------------------------------------------
% To Use Huffman Method to encode the input string of symbols
% ---
% Input:
%     SymString - the input string of symbols
% Output:
%     BitString - the encoded data, in uint8 type
%     SymCodeTable - symbol code table, code is a uint8 vector
% ------------------------------------------------------------------------

SymCodeTable = getSymCodeTable(SymString);

return