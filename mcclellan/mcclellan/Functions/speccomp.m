function   speccomp(x, ncenter, win, nfft, pltinc)
%SPECCOMP    Plots spectra with hamming windows of different 
%            lengths all centered at the same place.
%
%   Usage:  speccomp(x, ncenter, win, nfft, pltinc)
%
%           x : input signal vector
%     ncenter : sample number that windows are centered on
%         win : vector of window lengths; 
%                should use odd lengths, e.g. [401,201,101]
%        nfft : FFT size
%      pltinc : offset of plots (in dB)

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

J = sqrt(-1);
x = x(:);       %--- make it a column
nwins = length(win);
X = zeros(nfft, nwins);
con = 1;
coninc = 10^(pltinc/20);
for k=1:nwins
    n1 = ncenter - fix(win(k)/2);
    n2 = ncenter + fix(win(k)/2);
    Lh = n2-n1+1;
    X(:,k) = con*fft(x(n1:n2).*hamming(Lh), nfft);
    con = con/coninc;
end
f = (0:nfft/2)*(8000/nfft);
X = J*20*log10(abs(X(1:nfft/2+1,:))) + (ones(nwins,1)*f).';
plot(X)
xlabel('Frequency in Hz')
ylabel('Log Magnitude in dB')
title( 'Short-Time Spectra with Different Window Lengths')
