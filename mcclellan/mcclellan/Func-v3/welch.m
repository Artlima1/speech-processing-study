function  [P, c] = welch(x, N, M, wintype, nplot)
%WELCH   Power Spectrum Estimation by Welch's method
%-----
%   Usage:      [P,c] = welch(x,N,M,wintype,nplot)
%
%       P : power spectrum by Welch's method
%       c : correlation function = inverse of Welch power spectrum
%       x : input signal vector
%       N : FFT length
%       M : window length
%   wintype = 'r' for rectangular
%                 otherwise, Hamming window is used
%     nplot = omitting this argument suppresses plotting

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

x = x(:);
if(wintype=='r')
    w = ones(M,1);
else
    w = hamming(M);
end
K = fix((length(x)-M/2)/(M/2));
KLU = K*sum(w.^2);
P = zeros(N,1);
for i=1:K
    ibeg = (M/2)*(i-1) + 1;
    X = fft(x(ibeg:ibeg+M-1).*w, N);
    P = P + abs(X).^2;
end
P = P/KLU;
c = ifft(P);
c = real(c(1:M/2));
P = P(1:N/2+1);
if( nargin==5 )
  axis([0 1 0 max(P)])
  plot((0:N/2)/(N/2),P)
  title(['Welch Power Spectrum: Window length=',...
      num2str(M), '  Number sections=', num2str(K)])
  xlabel('FREQUENCY  (omega/pi)')
  pause
  axis;
  plot((0:N/2)/(N/2),10*log10(P))
  title(['Welch Log Power Spectrum: Window length=',...
      num2str(M), '  Number sections=', num2str(K)])
  xlabel('FREQUENCY  (omega/pi)')
  pause
  stem(0:M/2-1, c)
  title(['Welch Correlation Function: Window length=',...
      num2str(M), '  Number sections=', num2str(K)])
  xlabel('LAG INDEX')
end
