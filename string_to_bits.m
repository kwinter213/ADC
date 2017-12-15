function bits = string_to_bits(string)
    str = [];
for i = 1:length(string)
    str = horzcat(str, dec2bin(string(i)));
end
bits = [];
for i = 1:length(str)
    bits(i) = str2num(str(i));
end

