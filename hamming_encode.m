function encoded = hamming_encode(message)
% Function generates encoded message using 
% Hamming coding method. It takes a row vector of length 4.
% Generator matrix G produces a 7 bit matrix with 3 parity bits.

if length(message) ~= 4
    disp("Input vector wrong length");
end

G = [0 1 1 1 0 0 0;
     1 0 1 0 1 0 0;
     1 1 0 0 0 1 0;
     1 1 1 0 0 0 1]; 

encoded = (message*G);
encoded = mod(encoded, 2);

end
