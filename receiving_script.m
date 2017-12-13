messageLength = 1040+240;
boxWidth = 50;
load('norandHead.mat')
load('recievedLaurensNoRandUSRPRead.mat')
load('Laurens.mat')
recievedUSRPread = read_usrp_data_file('recievedLaurensNoRandUSRPRead.dat');
[receHead,reciMess] = trimmingsketch(recievedUSRPread,norandHead,messageLength);
[adjustedMess] = phase_adjust(reciMess,receHead);
RealSign = sign(real(adjustedMess));
ImagSign = sign(imag(adjustedMess))*sqrt(-1);
Signs = RealSign + ImagSign;
unboxed = unboxing(Signs, boxWidth);
HammingDecoded = hamming_decode(unboxed);
errorRate = errorCalculation(Laurens,HammingDecoded);