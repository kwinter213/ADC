# ADC
ADC final project in matlab

Analog and Digital Communications Final Project
Kimberly Winter, March Saper, Lauren Pudvan

Hamming it Up

For our final project, we will use two USRP radios to maximize the data rate between these radios. Our plan of attack will firstly be to get an MVP data rate using PAM working, which will involve timing synchronization and figuring out USRP software. Then, we will attempt QAM, taking into account the amount of power used, to maximize the number of bits transmitted per symbol.

Our “going beyond” element will be implementing a Hamming code in our data transmission. We will find the best algorithm for our purposes, fully understand it employ it in our data transmission. We will explore how the implementation of a Hamming code affects our data rate and how it changes our bit-error rate. We will try to find an optimal trade off between these two. 


Reading File from command line:

Make sure in C directory: 
C:\cd C:\Program Files\UHD\lib\uhd\examples

Then run this to receive, make sure you start receiving before sending:

C:\Program Files\UHD\lib\uhd\examples>rx_samples_to_file --rate 250e3 --freq 2.489e9 --type float --gain 20 --file C:\Users\lpudvan\Documents\MATLAB\received.dat
