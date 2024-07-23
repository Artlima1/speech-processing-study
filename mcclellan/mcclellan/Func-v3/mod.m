function y = mod(x,N)
%MOD    Compute (x mod N) and x can be 
%---      either positive or negative.
%
%   Usage:  y = mod(x,N);
%
%        y : remainder of (x/N) 
%        x : the input number(s)
%        N : the divider
%
%  see also REM

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

y = rem( rem(x,N)+N, N );
