function [receHead,reciMess] = trimming(recievedFileToBeTrimmed, starter, lengthStartAndMsg)
%     This is a function to trim the received data file to just the
%     message. Starter must have an even length. Outputs message
%     with header

[corrWithStarter, starterLag] = (xcorr(recievedFileToBeTrimmed,starter));
[~,I] = max(abs(corrWithStarter));
lagStart = starterLag(I) + 1;   % Not the actual start, must account for header offset
disp(lagStart)
figure;
%plot(starterLag, corrWithStarter);

messageStart = 0;
for i = lagStart-1000:length(recievedFileToBeTrimmed)
    if abs(real(recievedFileToBeTrimmed(i))) > .01
        messageStart = i;
        break
    end
end

if messageStart == lagStart-300
    error('triming error, retransmit')
end
    disp(real(recievedFileToBeTrimmed(messageStart)))
    disp(messageStart)
%     result is trimmed file where only the front is trimmed off
receHead = recievedFileToBeTrimmed(messageStart:messageStart+length(starter)-1);
reciMess = recievedFileToBeTrimmed(messageStart+length(starter):messageStart+lengthStartAndMsg-1); 

figure;
plot(real(recievedFileToBeTrimmed(messageStart-100:end)));
plot(imag(recievedFileToBeTrimmed(messageStart-100:end)));

end

