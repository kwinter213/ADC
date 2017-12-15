# ADC

## Analog and Digital Communications Final Project in matlab
## Kimberly Winter, March Saper, Lauren Pudvan
### Hamming it Up

We used two USRP radios to transfer data using Quadrature Amplitude Modulation and error-correcting Hamming codes. 


### Sending File from command line:
- Make sure in C directory: 
- C:\cd C:\Program Files\UHD\lib\uhd\examples

Run something similar to this to send, make sure you start receiving before sending:
- C:\Program Files\UHD\lib\uhd\examples>tx_samples_from_file --rate 260e3 --freq 2.489e9 --type float --gain 20 --file C:\[file location and name]

Double check that you have downloaded all the functions in this repository. Then edit and run SendingScript.m for the file names desired.


### Reading File from command line:
- Make sure in C directory: 
- C:\cd C:\Program Files\UHD\lib\uhd\examples

Then run something similar to this to receive, make sure you start receiving before sending:
- C:\Program Files\UHD\lib\uhd\examples>rx_samples_to_file --rate 260e3 --freq 2.489e9 --type float --gain 20 --file C:\[file location and name]

Double check that you have downloaded all the functions in this repository. Then edit and run receiving_script.m for the file names desired.


