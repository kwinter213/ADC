function  write_usrp_data_file( x )
% Write the complex signal into a file tx.dat, suitable for usrp 
% transmission you will need to make sure the program used for
% transmitting the data (e.g. tx_samples_from_file) is set to read 
% floating point numbers e.g.use the command line option --format float  
% for tx_samples_from_file
% and "complex" for gnuradio companion file sink



    tmp = zeros(2*length(x),1);
    tmp(1:2:end) = real(x);
    tmp(2:2:end) = imag(x);

    f1 = fopen('tx.dat', 'w');
    fwrite(f1, tmp, 'float32');
    fclose(f1);

end

