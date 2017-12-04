function y = errorCalculation(expected,actual)
    errorCounter = 0;
    for i = 1:length(expected)
        if expected(i) ~= actual(i)
            errorCounter = errorCounter + 1;
        end
    end
    errorRate = errorCounter/length(expected);
    disp(errorRate)
end