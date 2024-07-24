function Ainv = pseudinv(A, r)
%PSEUDINV   Pseudo-inverse of rank r.
%--------
%   Usage:    Ainv = pseudinv(A, r)
%
%      produces the rank-r inverse of A, from the SVD of A.
%      Only r singular values are retained for the inverse
%      with the exception that singular values less than
%      MAX(SIZE(A)) * S(1) * EPS are discarded.
%      Ainv = pseudinv(A) uses all possible singular values.
%
% See also  SVD and PINV

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

[U,S,V] = svd(A);
S = diag(S);
keep = sum( S > (max(size(A)) * S(1) * eps) );
if (nargin == 1)
   r = keep;
else
   r = min( r, keep );
end
S = diag( ones(r,1) ./ S(1:r) );
Ainv = V(:,1:r) * S * U(:,1:r)';
