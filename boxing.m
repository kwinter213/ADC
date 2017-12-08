function boxedFunction = boxing(PostHammingFile,BoxWidth)
temporaryvector = zeros(length(PostHammingFile) * BoxWidth);
BoxOfOnes = ones(BoxWidth);
for i = 1:length(PostHammingFile)
    toAdd = BoxOfOnes * i;
    temporaryvector[(i-1)*BoxWidth +1:(i-1)*BoxWidth+1+BoxWidth] = toAdd;
end
boxedFunction = temporaryvector;
end