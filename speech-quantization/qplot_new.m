function     qplot(s, nbits, mu, ncases)
%QPLOT    for plotting dependence of signal-to-noise ratio
%-----           on decreasing signal level
%
%   Usage:   qplot(s, nbits, mu, ncases)
%
%             s : input test signal
%         nbits : number of bits in quantizer
%            mu : mu-law compression parameter
%        ncases : number of cases to plot
%
%  NOTE: assumes ROUNDING for quantizer
%        and requires user-written MULINV and SNR
%
%  see also MULAW and FXQUANT

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

P = zeros(ncases,2);
x = s;
for i=1:ncases
   sh = fxquant(x, nbits, 'round', 'sat');
   P(i,1) = (i-1)+sqrt(-1)*snr_mcclellan(sh,x);
   y = mulaw(x, mu);
   yh = fxquant(y, nbits, 'round', 'sat');
   xh  =mulawinv(yh, mu);
   P(i,2) = (i-1)+sqrt(-1)*snr_mcclellan(xh,x);
   x = x/2;
end
plot(P)
title(['SNR for ', num2str(nbits), '-bit Uniform and ',...
         num2str(mu), '-Law Quantizers'])
xlabel('power of 2 divisor');   ylabel('SNR in dB')
