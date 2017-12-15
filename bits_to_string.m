function string = bits_to_string(bits)
% Takes in bits and converts to text. Assumes text only

string = [];

for i = 1:7:length(bits)-6
    disp(bits(i:i+6))
     string = horzcat(string, char(bin2dec(num2str((bits(i:i+6))))));

end
