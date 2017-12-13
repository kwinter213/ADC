Header = norandHead;
MessageReal = real(Laurens);
HammedMessageReal = hamming_encode(MessageReal');
BoxedMessageReal = boxing(HammedMessageReal,5);

MessageImag = imag(Laurens);
HammedMessageImag = hamming_encode(MessageImag');
BoxedMessageImag = boxing(HammedMessageImag,5);

Message = BoxedMessageReal + BoxedMessageImag*sqrt(-1);

ToSend = vertcat(Header', Message); % complex vector
write_usrp_data_file(ToSend);
