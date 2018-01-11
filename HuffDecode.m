function Decoded = HuffDecode(BitStringInUint8, SymCodeTable)

% ------------------------------------------------------------------------
% To Use SymCodeTable to decode the BitStringInUint8
% ---
% Input:
%     BitStringInUint8 - the encoded data, in uint8 type
%     SymCodeTable - cell of sym and code, code is a cell of uint8 vectors
% Output:
%     Decoded - the encoded data, in uint8 type
% ------------------------------------------------------------------------

Decoded = [];
Symbol = SymCodeTable{1};
Code = SymCodeTable{2};

Codebuf = []; % code buffer
for i = 1:length(BitStringInUint8)
    Codebuf = [Codebuf, BitStringInUint8(i)];
    index = findCode(Code, Codebuf);
    if (index > 0)
        Decoded = [Decoded, Symbol(index)];
        Codebuf = [];
    end
end

return



function idx = findCode(Code, x)

% ------------------------------------------------------------------------
% To find the index of x in Code
% ------------------------------------------------------------------------

for i = 1:length(Code)
    if (isequal(Code{i}, x))
%         disp([Code{i}, 111, x, 111, i]);
        idx = i;
        return
    end
    idx = 0;
end

return