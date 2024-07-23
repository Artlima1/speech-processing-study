function   p = acimp(b, a, N)
%ACIMP   Calculate autocorrrelation sequence of an impulse
%-----    response given the coefficients of H(z) = B(z)/A(z).
%
%   Usage:  p = acimp(b, a, N);
%
%        p : autocorrelation sequence of the impulse response
%      b,a : coefficients of H(z) = B(z)/A(z)
%        N : time index from 0 to N will be calculated.

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

h = filter(b, a, [1 zeros(1,N)]);
hh = fliplr(h);
p = conv(h, hh);
p = p(1:N+1);
p = fliplr(p);
