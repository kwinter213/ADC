function [receHead,reciMess] = trimmingsketch(recievedFileToBeTrimmed, starter, lengthStartAndMsg)
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

if messageStart == lagStart-300
    error('triiming error, retransmit')
end
    disp(real(recievedFileToBeTrimmed(messageStart)))
    disp(messageStart)
%     result is trimmed file where only the front is trimmed off
receHead = recievedFileToBeTrimmed(messageStart:messageStart+length(starter)-1);
reciMess = recievedFileToBeTrimmed(messageStart+length(starter):messageStart+lengthStartAndMsg-1); 
end
