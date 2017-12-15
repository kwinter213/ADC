Header = norandHead;
SentMessage = Message;
messageLength = length(Header)+length(SentMessage);
boxWidth = 50;

receivedUSRPread = read_usrp_data_file();
plot(real(receivedUSRPread))

[receHead,reciMess] = trimming(receivedUSRPread,Header,messageLength);

[adjustedMess] = phase_adjust(reciMess,receHead, Header);    %phase adjust the unboxed function. Need known header

RealSign = sign(real(adjustedMess));
ImagSign = sign(imag(adjustedMess));

unboxedMessageReal = unboxing(real(Message), boxWidth);
unboxedMessageImag = unboxing(imag(Message), boxWidth);

unboxedReal = unboxing(RealSign, boxWidth);
unboxedImag = unboxing(ImagSign, boxWidth);

%Error calc that takes into account the fact that only half the expected
%message will actually be sent, usually, by the USRP for unknown reasons.
%And accounts for weird transmission quirk
probablyend = ceil(length(unboxedMessageReal)*.55);
preDecodeError = errorCalculation(vertcat(unboxedMessageReal(1:probablyend-1), unboxedMessageImag(1:probablyend-1)), vertcat(unboxedReal(2:probablyend), unboxedImag(2:probablyend)));

HammingDecodedReal = hamming_decode(unboxedReal);
HammingDecodedImag = hamming_decode(unboxedImag);
Word1 = bits_to_string(HammingDecodedReal)
Word2 = bits_to_string(HammingDecodedImag)

