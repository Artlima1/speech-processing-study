function     qplot_alt(s, nbits, mu, ncases)
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


P = zeros(ncases,5);
x = s;
for i=1:ncases
    %linear 1
   sh = fxquant(x, nbits, 'round', 'sat');
   P(i,1) = (i-1)+sqrt(-1)*snr_mcclellan(sh,x);

    y = mulaw(x, mu);
   %mu-law 0
   yh = fxquant(y, nbits, 'round', 'sat');
   xh  =mulawinv(yh, mu);
   P(i,2) = (i-1)+sqrt(-1)*snr_mcclellan(xh,x);

   %mu-law 1
   yh = fxquant(y, nbits-2, 'round', 'sat');
   xh  =mulawinv(yh, mu);
   P(i,3) = (i-1)+sqrt(-1)*snr_mcclellan(xh,x);

   %mu-law 2
   yh = fxquant(y, nbits-4, 'round', 'sat');
   xh  =mulawinv(yh, mu);
   P(i,4) = (i-1)+sqrt(-1)*snr_mcclellan(xh,x);

   %mu-law 3
   yh = fxquant(y, nbits-6, 'round', 'sat');
   xh  =mulawinv(yh, mu);
   P(i,5) = (i-1)+sqrt(-1)*snr_mcclellan(xh,x);

   x = x/2;
end

plot(P)
title(['SNR para ', num2str(nbits), '-bit Uniform and ', num2str(nbits),...
    ', ', num2str(nbits-2),', ', num2str(nbits-4),', ', num2str(nbits-6)...
    '-bit em ' ,num2str(mu), '-Law Quantizers'])

legenda(1) = sprintf("Linear %db",nbits);
legenda(2) = sprintf("mu-Law %db",nbits);
legenda(3) = sprintf("mu-Law %db",nbits-2);
legenda(4) = sprintf("mu-Law %db",nbits-4);
legenda(5) = sprintf("mu-Law %db",nbits-6);

legend(legenda(1),legenda(2),legenda(3),legenda(4),legenda(5));
xlabel('power of 2 divisor');   ylabel('SNR in dB')
legend('Location','west');
