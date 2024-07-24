function y = asinc( x, L )
%ASINC   compute sin(Lx/2)/sin(x/2)   (for matrix x)
%-----
%   Usage:   y = asinc(x, L)
%
%      x : argument of asinc function
%      L : length of corresponding rectangular pulse
%
%  NOTE: the argument "x" is NOT multiplied by PI
%
%     see also DIRIC in version 3.0 Sig Proc Toolbox and higher

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

y = sin(0.5*x);
jkl = abs(y) < 1e-10;

y = jkl*L + (~jkl).*sin((L/2)*x)./(y + jkl);