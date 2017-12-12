function y = trimmingsketch(recievedFileToBeTrimmed, starter, msgLength)
%     This is a function to trim the received data file to just the
%     message. Starter must have an even length. Outputs message
%     with header

[corrWithStarter, starterLag] = (xcorr(recievedFileToBeTrimmed,starter));
[~,I] = max(abs(corrWithStarter));
lagStart = starterLag(I) + 1;   % Not the actual start, must account for header offset
disp(lagStart)

messageStart = 0;
for i = lagStart-300:length(recievedFileToBeTrimmed)
    if abs(real(recievedFileToBeTrimmed(i))) > 1e-3
        messageStart = i;
        break
    end
end
    disp(real(recievedFileToBeTrimmed(messageStart-1)))
    disp(messageStart-1)
%     result is trimmed file where only the front is trimmed off
    y = recievedFileToBeTrimmed(messageStart:messageStart + msgLength); 
end