Header = norandHead;
MessageReal = real(Laurens);
HammedMessageReal = hamming_encode(MessageReal');
BoxedMessageReal = boxing(MessageReal,5)';

MessageImag = imag(Laurens);
HammedMessageImag = hamming_encode(MessageImag');
BoxedMessageImag = boxing(MessageImag,5)';

Message = BoxedMessageReal + BoxedMessageImag*sqrt(-1);
for i =1:1000
    ones(i)=1;
end
ToSend = [ones,zeros(1000,1)', Header, Message, zeros(1000,1)', ones]; % complex vector
write_usrp_data_file(ToSend);
