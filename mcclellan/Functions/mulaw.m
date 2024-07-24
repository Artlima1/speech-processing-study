function y = mulaw(x, mu)
%MULAW    mu-law compression for signals with
%-----         assumed maximum value of 32767
%
%   Usage:   y = mulaw(x, mu);
%
%      x : input signal, column vector with max value 32767
%     mu : compression parameter (mu=255 used for telephony)
%
%  see also MULAWINV

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

Xmax = 32767;
y = (Xmax/log(1+mu))*log(1+mu*abs(x)/32767).*sign(x);
