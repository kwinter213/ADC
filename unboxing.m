function unboxed = unboxing(received, boxWidth)
% Function takes boxed input function and box size and outputs 
% bit string (downsamples)

unboxed = zeros(ceil(length(received)/boxWidth), 1);
index = 1;

for i = 1:length(received)
    if mod(i, boxWidth) == 0
            unboxed(index) = received(i);
            index = index + 1;
    end
end

disp(unboxed)
end