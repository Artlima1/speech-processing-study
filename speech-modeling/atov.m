function  [r, D, G] = AtoV(A,rN)
%AtoV    find reflection coefficients & system function
%----        denominator for lossless tube models.
%   Usage:   [r, D, G] = AtoV(A, rN)
%
%      rN : reflection coefficient at lips (abs value < 1)
%       A : array of areas
%       D : array of denominator coefficients
%       G : numerator of transfer function
%       r : corresponding reflection coefficients
%
%  NOTE: assumes no losses at the glottis end (rG=1).

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

[M,N] = size(A);
if(M~=1),  A = A';  end    %-- make row vector
N = length(A);
r = [ ];
for m=1:N-1
   r = [r (A(m+1)-A(m))/(A(m+1)+A(m))];
end
r = [r  rN];
D = [ 1 ];
G = 1;
for m=1:N
   G = G*(1+r(m));
   D = [D  0] + r(m).*[0  fliplr(D)];
end
