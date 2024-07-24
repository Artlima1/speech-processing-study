function factors = factorit(n)
%FACTORIT      factor an integer
%--------
%   Usage:  factors = factorit(n)
%
%         n : integer to factor
%   factors : vector containing all the factors

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

n = abs(n);
factors = [ ];
for d = [2,3:2:ceil(sqrt(n))]
  while rem(n,d) == 0
    n = n/d;
    factors = [factors, d];
    if n == 1,  return,  end
  end
end
if n~=1, factors = [factors, n]; end
