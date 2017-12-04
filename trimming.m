function y = trimming(recievedFileToBeTrimmed, starter)
%     This is a function to trimm the received data file to just the
%     message.


    autocorrelation = (xcorr(real(recievedFileToBeTrimmed),real(recievedFileToBeTrimmed)));
%     This will find the amount of noisy points in the file. So before the
%     desired section + after. Will be used to help error proof
    for i = 1:length(autocorrelation)
        if abs(autocorrelation(i)) > 1e-3
            amountOfNoiseyPoints = i;
            break
        end
    end
    
%     Finding the length of the recieved message
    lengthRecievedMessage = (length(autocorrelation)/2) - amountOfNoiseyPoints;
    
%     Finding the ammount to cut. Val is not used but needed to get index
    corrWithStarter = (xcorr(real(recievedFileToBeTrimmed),real(starter)));
    [ValMaxCorrStarter,IdxMaxCorrStarter] = max(corrWithStarter);
    cutAmout = IdxMaxCorrStarter - (length(starter)/2);
    
    
%     result is trimmed file where only the front is trimmed off
    y = recievedFileToBeTrimmed(cutAmout:length(recievedFileToBeTrimmed)); 
end