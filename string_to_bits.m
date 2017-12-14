function bits = string_to_bits(string)
    bits = [];
for i = 1:length(string)
    bits = horzcat(bits, dec2bin(string(i)));
end
end

