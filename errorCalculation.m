function y = errorCalculation(expected,actual)
%     This is a function to calculate the expected error. It takes in 2
%     vectors: the expected result and the actual result and calculates the
%     percent error of the actual compared to the expected. It is important
%     that both vetors start the same.

    errorCounter = 0; % This is a counter
    
%     If the expected vector is longer than the actual vector this function
%     will not work and will return this error.
    if length(expected) > length(actual)
        error('expected is longer than actual')
    end
    
%     For every wrong value that the vectors do not match on the counter
%     will increase by 1.
    for i = 1:length(expected)
        if expected(i) ~= actual(i)
            errorCounter = errorCounter + 1;
        end
    end
    
%     Calculate percent error and produce result of function.
    errorRate = errorCounter/length(expected);
    y = errorRate;
end
