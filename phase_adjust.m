function [adjustedmess] = phase_adjust(received,rHead, knownHead)
%This function assumes Raleigh flat fading channel model 
%and corrects for constant phase offsets 

knownHead = knownHead(end-19:end);
tocorrect = vertcat(rHead(end-19:end), received);
corrected = zeros(length(tocorrect),1);

Fourth = tocorrect.^4;   % ^4 makes 1 + 1j term constant
FFTfourth = fftshift(fft(Fourth)); % looking for freq offset
ws =(-pi:2*pi/length(Fourth):pi-2*pi/length(Fourth));   % corresponding angular frequency

[P,I] = max(FFTfourth); % find index of maximum frequency (phase offset)
angfreqOff = (ws(I)/4); % find corresponding angular frequency of offset
phaseOff=angle(P)/4;

for k = 1:length(tocorrect)
   corrected(k) = tocorrect(k)./exp(angfreqOff*k*1j+phaseOff*1j);   % adjust for phase offset
end

% correct the quadrant
% figure out where the last 20 values of the Header (the first 20 of
% tocorrect) should go
knownPhase = 0;
for i = 1:20
    kno = phase(knownHead(i));
    if kno < 0
        kno = 2*pi + kno;
    end
    knownPhase = knownPhase + kno;
end
knownPhase = knownPhase/20;

offPhase=0;
for k=1:20
    off = phase(corrected(k));
    if off < 0
        off = 2*pi + off;
    end
    offPhase=offPhase+ off;
end

offPhase = offPhase/20;

phaseCorrection = knownPhase - offPhase;


for k = 1:length(corrected)
   corrected(k) = corrected(k)*exp((phaseCorrection)*1j);   % adjust for phase offset
end

% newcorrected;
figure;
hold on;
plot(corrected(1:20), 'r.');
plot(corrected(21:end), 'b.');

adjustedmess = corrected(21:end);

% from quirk of last transmission, adjustedmess is actually
adjustedmess = vertcat(zeros(50,1), adjustedmess(1:end-50));
end
