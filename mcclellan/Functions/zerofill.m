function Y_out = zerofill(X_in, L)
%Zerofill is the "expander" operation used in multi-rate filters
%-----
%                       /  x(n/L),  for n = 0 modulo L
%               y(n) = < 
%                       \  0,       otherwise
%
%   Usage:   y = zerofill(x, L)
%
%       x : input signal vector
%       L : fill with L-1 zeros between each sample.
%       y : output signal vector ==> Length(y) = L*Length(x)
%
%    NOTE: if x is a matrix, zerofill is applied to each column

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

[M,N] = size(X_in);
if M==1                  %--- vector is a single row ---------
   Y_out = zeros(1, N*L);
   Y_out(1, 1:L:N*L) = X_in;
else                     %--- vector is column or matrix -----
   Y_out = zeros(M*L, N);
   Y_out(1:L:M*L, :) = X_in;
end
