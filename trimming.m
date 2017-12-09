function y = trimming(recievedFileToBeTrimmed, starter, ender)
%     This is a function to trimm the received data file to just the
%     message. Starter and ender must have an even length. 

   
%     Finding the ammount to cut. 
    [corrWithStarter, starterLag] = (xcorr(recievedFileToBeTrimmed,starter));
    [~,I] = max(abs(corrWithStarter));
    lagStart = starterLag(I) - length(starter)/2;   % Not the actual start, must account for header offset
    
%    Finding the ending point. 
    [corrWithEnder, enderLag] = (xcorr(recievedFileToBeTrimmed,ender));
    [~,J] = max(abs(corrWithEnder));
    lagEnd = enderLag(J) - length(ender)/2;   % Not the actual start, must account for header offset
    
%     result is trimmed file where only the front is trimmed off
    y = recievedFileToBeTrimmed(lagStart:lagEnd); 
end
