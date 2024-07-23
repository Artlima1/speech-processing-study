function y = srexpand(x, L)
%SREXPAND    zero fills with L-1 zeros between each sample
%--------
%   Usage:  Y = srexpand(X, L)
%
%       insert L-1 zeros between each sample of the sequence X.
%       The output sequence Y has length equal to length(x)*L.
%
%  see also ZEROFILL

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

y = zerofill(x, L);   %--- use ZEROFILL to do the work