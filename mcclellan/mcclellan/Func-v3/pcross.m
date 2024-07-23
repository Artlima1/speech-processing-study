function pcross( z, asize, azero )
%PCROSS   plot crosses --- used in pole-zero plots
%------
%          INTERNAL SUPPORT file called by zplane.m
%
%     ===> ASSUMES THAT PLOT is being HELD
%
%   with 3 args, it plots a circle:  O
%   with 2 args, it makes a cross:   X

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

L = length(z);
if nargin < 3
   del = asize*(1+j);
   del1 = asize*(1-j);
   for i=1:L
      plot( [z(i)-del; z(i)+del], 'w-')
      plot( [z(i)-del1;z(i)+del1], 'w-')
   end
else
   del = asize*[ifft([0;20;zeros(18,1)]);1];
   for i=1:L
      plot( z(i)+del, 'w-')
   end
end
