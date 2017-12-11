function y = trimming(recievedFileToBeTrimmed, starter, msgLength)
%     This is a function to trimm the received data file to just the
%     message. Starter must have an even length. Outputs message
%     with header

   
%     Finding the where starter starts
    [corrWithStarter, starterLag] = (xcorr(recievedFileToBeTrimmed,starter));
    [~,I] = max(abs(corrWithStarter));
    lagStart = starterLag(I) + 1;   % Not the actual start, must account for header offset
    
    
%     result is trimmed file where only the front is trimmed off
    y = recievedFileToBeTrimmed(lagStart:lagStart + msgLength); 
end

