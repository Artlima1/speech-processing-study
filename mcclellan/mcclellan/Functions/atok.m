function k = atok(a)
%ATOK      converts AR polynomial to reflection coefficients
%----
%   Usage:   K = atok(A)
%        where each column of A contains polynomial coeffs
%          and   "    "    of K contains PARCOR coeffs
%
%     If A is matrix, each column is processed separately.
%   see also KTOA

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

[M,N] = size(a);
if M==1               %-- make row into column
   a = a(:);
   [M,N] = size(a);  end
k = zeros(M-1,N);     %-- # refl. coeffs = # of roots = degree-1
for i=M-1:-1:1
   k(i,:) = a(i+1,:);
   b = flipud(conj(a));
   kmag = k(i,:).*conj(k(i,:));
   for j=1:N
      a(:,j) = ( a(:,j) - k(i,j)*b(:,j) ) ./ (1 - kmag(j));
   end
   a(i+1,:) = [];
end
