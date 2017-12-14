function [newcorrected] = phase_adjust(received,rHead)
%This function assumes Raleigh flat fading channel model 
%and corrects for constant phase offsets 

%corrected = zeros(length(received-1)); 

Fourth = received.^4;   % ^4 makes 1 + 1j term constant
FFTfourth = fftshift(fft(Fourth)); % looking for freq offset
ws =(-pi:2*pi/length(Fourth):pi-2*pi/length(Fourth));   % corresponding angular frequency

[P,I] = max(FFTfourth); % find index of maximum frequency (phase offset)
angfreqOff = (ws(I)/4); % find corresponding angular frequency of offset
phaseOff=angle(P)/4;

for k = 1:length(received)-1
   corrected(k) = received(k)./exp(angfreqOff*k*j+phaseOff*j);   % adjust for phase offset
end
for k =length(rHead)-18:length(rHead)-1
    headoff(k)= rHead(k)./exp(-angfreqOff*k*1j); %adjust for phase offset
end

counter=0;
for k=1:length(headoff)
    counter=counter+angle(headoff(k));
end

offsettot=counter/length(headoff); %taking the average of these points is now our phase offset avg.
%degrees=offsettot*180/pi;
if(offsettot<pi/2 && offsettot>0)
    move= pi/2; %shift 
elseif(offsettot>pi && offsettot>pi/2)
    move=0;
elseif(offsettot>-pi &&offsettot<-pi/2)
    move=3*pi/2;
elseif(offsettot<0 && offsettot>-pi/2)
    move=pi;
else
    display(move);
end


for k = 1:length(corrected)
   newcorrected(k) = corrected(k)/exp((-move)*1j);   % adjust for phase offset
end

newcorrected;
figure;
hold on;
plot(received, 'r.');
plot(corrected, 'b.');
plot(newcorrected,'g.');



end
