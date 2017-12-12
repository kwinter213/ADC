function [corrected,headoff] = phase_adjust(received,rHead)
%This function assumes Raleigh flat fading channel model 
%and corrects for constant phase offsets 

%corrected = zeros(length(received-1)); 

Fourth = received.^4;   % ^4 makes 1 + 1j term constant
FFTfourth = fftshift(abs(fft(Fourth))); % looking for freq offset
ws =(-pi:2*pi/length(Fourth):pi-2*pi/length(Fourth));   % corresponding angular frequency
figure; 
plot(ws, FFTfourth)
[~,I] = max(FFTfourth); % find index of maximum frequency (phase offset)
angfreqOff = (ws(I)/4); % find corresponding angular frequency of offset

for k = 1:length(received)-1
   corrected(k) = received(k)./exp(angfreqOff*k*j);   % adjust for phase offset
end
for k =length(rHead)-18:length(rHead)-1
    headoff(k)= exp(-angfreqOff*k*1j).*rHead(k); %adjust for phase offset
end

figure;
hold on;
plot(rHead(length(rHead)-20:length(rHead)-1), 'r.');
plot(headoff,'b.');
counter=0;
for k=1:length(headoff)-1
    counter=counter+angle(headoff(k));
end

offsettot=counter/length(headoff); %taking the average of these points is now our phase offset avg.
degrees=offsettot*180/pi;
move=315-degrees;

for k = 1:length(corrected)-1
   newcorrected(k) = corrected(k)/exp((-move)*1j);   % adjust for phase offset
end
newcorrected;
figure;
hold on;
plot(received, 'r.');
plot(corrected, 'b.');
plot(newcorrected,'g.');



end
