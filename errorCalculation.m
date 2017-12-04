function y = errorCalculation(expected,actual)
    errorCounter = 0;
    
    if length(expected) > length(actual)
        error('expected is longer than actual')
    end
    for i = 1:length(expected)
        if expected(i) ~= actual(i)
            errorCounter = errorCounter + 1;
        end
    end
    errorRate = errorCounter/length(expected);
    y = errorRate;
end
