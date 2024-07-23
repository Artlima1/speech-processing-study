function y = dB( x, dBrange, dBmax )
%DB     convert an array to decibels
%--         
%  Usage:   Y = dB( X, dbRANGE, dbMAX )
%
%          will compute 20 Log(X)
%          and then scale or clip the result so that
%          the minimum dB level is dbMAX-dbRANGE.
%          ex: db(X, 80, 0) gives the range 0 to -80 dB
%
%      Y = dB( X, dbRANGE ) defaults to dBmax = 0

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

if dBrange<=0
   error(' min dB is max dB minus dBrange')
end
if nargin == 2
   dBmax = 0;   end
y = abs(x);
ymax = max(y)/10.0^(dBmax/20);
if size(x,1)==1
   y = y/ymax;
else
   for i=1:size(y,2)
      y(:,i) = y(:,i)/ymax(i);
   end
   % scale all columns, unless x is row vector
end 
thresh = 10.0^((dBmax-dBrange)/20);
y = y.*(y>thresh) + thresh.*(y<=thresh);
y = 20.0*log10(y);
