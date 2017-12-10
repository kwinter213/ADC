function decoded = hamming_decode(received)
% Function decodes Hamming encoded message using 
% It takes an encoded row vector of length 7 and returns the decoded
% vector. Can correct up to 1 bit error.

if length(received) ~= 7
    disp("input vector wrong length");
end

wrongIndex = 0;
corrected = received;

% parity check matrix in order of increasing binary numbers
H = [0 0 0 1 1 1 1;
     0 1 1 0 0 1 1;
     1 0 1 0 1 0 1];

check = mod(received*H',2); % if 1 bit error, returns vector which matches column corresponding to incorrect location

wrongBit =bi2de(fliplr(check))     % convert binary number/column error to index
    
if wrongBit > 0
    corrected(wrongBit) = corrected(wrongBit) + 1;
    corrected = mod(corrected, 2);  % correct the error (if exists)
    
end

decoded = [corrected(3), corrected(5), corrected(6), corrected(7)]; % decoded message, removes parity bits

end
