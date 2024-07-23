function  ss = pronysyn( lam, c, nn )
%PRONYSYN   synthesize a sum of exponentials
%--------
%    Usage:    ss = pronysyn( lam, c, nn )
%
%      lam = vector of EXPONENTS
%        c = vector of weights
%       nn = vector of time indices
%       ss = output signal

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

N = length(lam);
ss = 0*nn;
for k = 1:N
   ss = ss + c(k)*exp(lam(k)*nn);
end
