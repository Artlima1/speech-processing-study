function   [gd, w] = gdel(x, n, Lfft)
%GDEL    compute the group delay of x[n]
%----
%   Usage:   [gd, w] = gdel( x, n, Lfft )
%
%       x :  Signal x[n] at the times (n)
%       n :  Vector of time indices
%    Lfft :  Length of the FFT used
%      gd :  Group Delay values on [-pi,pi)
%       w :  List of frequencies over [-pi,pi)
%
% NOTE:  group delay of B(z)/A(z) = gdel(B) - gdel(A)

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

X = fft(x, Lfft);
dXdw = fft(n.*x, Lfft);           %--- transform of nx[n]
gd = fftshift(real( dXdw./X ));   %--- when X==0, gd=infinity
w = (2*pi/Lfft)*[0:(Lfft-1)] - pi;
