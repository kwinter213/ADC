function decoded = hamming_decode(received)
% Function decodes Hamming encoded message using 
% It takes an encoded row vector and returns decoded. Can correct up to 1 error per 
% every 7 bits. To work input, vector must be multiple of 7.

received = sign(received+1)

decoded = [];

for i = 1:7:length(received)- 6    % Every 7 bits are evaluated to decode into 4 bits
    todecode = received(i:i+6); % decode this section

if length(todecode) ~= 7
    disp("input vector wrong length");
end

wrongIndex = 0;
corrected = todecode;

% parity check matrix in order of increasing binary numbers
H = [0 0 0 1 1 1 1;
     0 1 1 0 0 1 1;
     1 0 1 0 1 0 1];

check = mod(todecode'*H',2)        % if 1 bit error, returns vector which matches column corresponding to incorrect location

wrongBit =bi2de(fliplr(check))     % convert binary number/column error to index
    
if wrongBit > 0
    corrected(wrongBit) = corrected(wrongBit) + 1;
    corrected = mod(corrected, 2);  % correct the error (if exists)
    
end

decoded = horzcat(decoded, [corrected(3), corrected(5), corrected(6), corrected(7)]); % decoded message, removes parity bits

end


end
