function encodedMessage = hamming_encode(Inputmessage)
% Function generates encoded message using 
% Hamming coding method. Message to be encoded. Message must multple of 4.
encodedMessage = [];
for i = 1:4:length(Inputmessage)
    
    message = Inputmessage(i:i+3); % encode this

if length(message) ~= 4
    disp('Input vector wrong length');
end

G = [1 1 1 0 0 0 0;
     1 0 0 1 1 0 0;
     0 1 0 1 0 1 0;
     1 1 0 1 0 0 1]; 

encoded = (message*G);
encoded = mod(encoded, 2);
disp(encoded);

encodedMessage = horzcat(encodedMessage, encoded); 
end

end

