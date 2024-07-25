function   stspect(x, nstart, ninc, nwin, nfft, nsect, pltinc)
%stspect(x, nstart, ninc, nwin, nsec, nfft, pltinc)
%           x : input signal
%           nstart : sample number that first window is centered on
%           ninc : offset between windowed segments
%           nwin : window lengths (should be odd)
%           nfft : fft size
%           nsect : number of sections to plot
%           pltinc : offset of spectra in plot (in dB)

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

J = sqrt(-1);
x = x(:);
X = zeros(nfft, nsect);
con = 1;
coninc = 10^(pltinc/20);
for k=1:nsect
    n1 = nstart + k*ninc - fix(nwin/2);
    n2 = nstart + k*ninc + fix(nwin/2);
    Lh = n2-n1+1;
    X(:,k) = con*fft(x(n1:n2).*hamming(Lh), nfft);
    con = con/coninc;
end
f = (0:nfft/2)*(8000/nfft);
X = J*20*log10(abs(X(1:nfft/2+1,:))) + (ones(nsect,1)*f).';
plot(X)
xlabel('Frequency in Hz')
ylabel('Log Magnitude in dB')
title( 'Short-Time Spectra in Different n values')
