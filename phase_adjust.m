function corrected = phase_adjust(received)
% This function assumes Raleigh flat fading channel model 
% and corrects for constant phase offsets 

corrected = zeros(length(received-1)); 

Fourth = received.^4;   % ^4 makes 1 + 1j term constant
FFTfourth = fftshift(abs(fft(Fourth))); % looking for freq offset
ws =(-pi:2*pi/length(Fourth):pi-2*pi/length(Fourth));   % corresponding angular frequency
figure; 
plot(ws, FFTfourth)
[~,I] = max(FFTfourth); % find index of maximum frequency (phase offset)
angfreqOff = (ws(I)/4); % find corresponding angular frequency of offset

for k = 1:length(received)-1
   corrected(k) = exp(-angfreqOff*k*1i).*received(k);   % adjust for phase offset
end

figure;
hold on
plot(received, 'r.');
plot(corrected, 'b.');

end