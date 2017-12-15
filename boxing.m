function boxedFunction = boxing(PostHammingFile,BoxWidth)
% This function takes in the box width and what is to be transmitted. It
% will make what is to be transmitted into boxes of with values from
% PostHammingFile and make it into boxes of width BoxWidth.

% Creates a vector of 0s that will be the final length
temporaryvector = zeros(length(PostHammingFile) * BoxWidth,1); 
% Creates vector of 1s length of a box
BoxOfOnes = ones(BoxWidth,1);

for i = 1:length(PostHammingFile) % Goes through values to transmit 
    toAdd = BoxOfOnes * PostHammingFile(i); % making the box to add
    % Overwriting the section of 0s with the box to add
    temporaryvector((i-1)*BoxWidth +1:(i-1)*BoxWidth+BoxWidth) = toAdd; 
end
% Making the result
boxedFunction = temporaryvector;
end
  
