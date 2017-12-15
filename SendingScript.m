Header = norandHead;
MessageReal = string_to_bits('jazziest');   %outputs 1's and 0's
HammedMessageReal = sign(hamming_encode(MessageReal)-.5);   %Hamming outputs 1's and 0's. Change this to 1's and -1's
BoxedMessageReal = boxing(HammedMessageReal,50)';

MessageImag = string_to_bits('buzzword');
HammedMessageImag = sign(hamming_encode(MessageImag)-.5);
BoxedMessageImag = boxing(HammedMessageImag,50)';

Message = BoxedMessageReal + BoxedMessageImag*sqrt(-1);

ToSend = [ones(1000, 1)',zeros(1000,1)', Header, Message, zeros(1000,1)', ones(1000, 1)']; % complex vector
write_usrp_data_file(ToSend);
