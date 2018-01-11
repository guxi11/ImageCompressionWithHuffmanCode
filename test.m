clc;

% one = ones(1,17);
% two = 2*ones(1,1);
% three = 3*ones(1,15);
% four = 4*ones(1,20);
% five = 5*ones(1,10);
% six = 6*ones(1,19);
% seven = 7*ones(1,18);
% 
% SymString = [one, two, three, four, five, six, seven];
% SymString = ['a','b','a','c','c','c','d'];

SymString = [1,1,3,2,5,5,6,6,6,3,3];

[BitStringInUint8, SymCodeTable] = HuffEncode(SymString);

% display mapping table
Symbol = SymCodeTable{1};
Code = SymCodeTable{2};
for i = 1:length(Symbol)
    disp([i, Symbol(i), Code{i}]);
end

Decoded = HuffDecode(BitStringInUint8, SymCodeTable)