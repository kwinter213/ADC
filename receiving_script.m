messageLength = 1040+240;
boxWidth = 5;
load('norandHead.mat')
load('recievedLaurensNoRandUSRPRead.mat')
load('Laurens.mat')
recievedUSRPread = read_usrp_data_file('recievedLaurensNoRandUSRPRead.dat');
[receHead,reciMess] = trimmingsketch(recievedUSRPread,norandHead,messageLength);
[adjustedMess] = phase_adjust(reciMess,receHead);
RealSign = sign(real(adjustedMess));
ImagSign = sign(imag(adjustedMess));
Signs = RealSign + ImagSign*sqrt(-1);
unboxedReal = unboxing(RealSign, boxWidth);
unboxedImag = unboxing(ImagSign, boxWidth);
HammingDecodedReal = hamming_decode(unboxedReal);
HammingDecodedImag = hamming_decode(unboxedImag);
RealImagDecoded = horzcat(HammingDecodedReal,HammingDecodedImag);
errorRate = errorCalculation(Laurens,RealImagDecoded);
