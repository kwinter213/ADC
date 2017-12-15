# ADC

## Analog and Digital Communications Final Project in matlab
## Kimberly Winter, March Saper, Lauren Pudvan
### Hamming it Up

For our final project, we used two USRP radios to transfer data between these radios. Our plan of attack to get an MVP transmission using QAM working, which will involve timing synchronization and figuring out USRP software. Then, we will improve QAM, taking into account the amount of power used, to maximize the number of bits transmitted per symbol.


Our “going beyond” element is implementing a Hamming code in our data transmission. We chose the best algorithm for our purposes, fully understand how to employ it in our data transmission. We explored how the implementation of a Hamming code affects our data rate and how it changed our bit-error rate. 


### Sending File from command line:
- Make sure in C directory: 
- C:\cd C:\Program Files\UHD\lib\uhd\examples

Then run something similar to this to send, make sure you start receiving before sending:
- C:\Program Files\UHD\lib\uhd\examples>tx_samples_from_file --rate 250e3 --freq 2.489e9 --type float --gain 20 --file C:\Users\lpudvan\Documents\MATLAB\sending.dat

Double check that you have downloaded all the functions in this repository. Then edit and run SendingScript.m for the file names desired.


### Reading File from command line:
- Make sure in C directory: 
- C:\cd C:\Program Files\UHD\lib\uhd\examples

Then run something similar to this to receive, make sure you start receiving before sending:
- C:\Program Files\UHD\lib\uhd\examples>rx_samples_to_file --rate 250e3 --freq 2.489e9 --type float --gain 20 --file C:\Users\lpudvan\Documents\MATLAB\received.dat

Double check that you have downloaded all the functions in this repository. Then edit and run receiving_script.m for the file names desired.


