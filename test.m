clc;

one = ones(1,17);
two = 2*ones(1,1);
three = 3*ones(1,15);
four = 4*ones(1,20);
five = 5*ones(1,10);
six = 6*ones(1,19);
seven = 7*ones(1,18);

SymString = [one, two, three, four, five, six, seven];

[BitStringInUint8, SymCodeTable] = HuffEncode(SymString);

Decoded = HuffDecode(BitStringInUint8, SymCodeTable)