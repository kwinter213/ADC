function unboxed = unboxing(received, boxWidth)
% Function takes boxed input function and box size and outputs 
% bit string (downsamples)

jumpForward = ceil(boxWidth/2); %trying to sample from middle of box

unboxed = zeros(ceil(length(received)/boxWidth), 1);
index = 1;

for i = 1:length(received)-jumpForward
    if mod(i, boxWidth) == 0
            unboxed(index) = received(i+jumpForward);
            index = index + 1;
    end
end

disp(unboxed)
end
