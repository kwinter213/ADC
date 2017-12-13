Header = norandHead;
Message = Laurens;
HammedMessage = hamming_encode(Message);
BoxedMessage = boxing(HammedMessage,50);
ToSend = vertcat(Header, BoxedMessage);
write_usrp_data_file(ToSend);