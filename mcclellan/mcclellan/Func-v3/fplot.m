function   fplot( xa, dt )
%FPLOT   Plot  Fourier Transform (Mag) of "ANALOG" signal
%-----
%   Usage:   fplot( xa, dt )
%
%       xa :  "ANALOG" signal
%       dt :  sampling interval for the simulation of xa(t)

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

L = length(xa);
Nfft = round( 2 .^ nextpow2(5*L) );
Xa = fft(xa, Nfft);
range = 0:(Nfft/4);
ff = range/Nfft/dt;
plot( ff/1000, abs( Xa(1+range) ) )
title('CONT-TIME FOURIER TRANSFORM (MAG)')
xlabel('FREQUENCY (kHz)'), grid
