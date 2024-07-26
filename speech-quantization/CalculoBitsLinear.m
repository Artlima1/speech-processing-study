% Exercício 4.2 - Cálculo de quantos bits precisa um quantizador linear
%para ter ao menos o mesmo SNR de um u-Law de 6 bits.


addpath("mcclellan/mcclellan/Functions/")
load("mcclellan/mcclellan/Data/s5.mat");
addpath("speech-quantization/")


s=s5/(2^15-1);
nbits=10;
mu=255; 
ncases=10;

P = zeros(ncases,6);
x = s;
for i=1:ncases
    %linear 1
   sh = fxquant(x, 11, 'round', 'sat');
   P(i,1) = (i-1)+sqrt(-1)*snr_mcclellan(sh,x);
   sh = fxquant(x, 12, 'round', 'sat');
   P(i,2) = (i-1)+sqrt(-1)*snr_mcclellan(sh,x);
    y = mulaw(x, mu);
   %mu-law 0
   yh = fxquant(y, nbits, 'round', 'sat');
   xh  =mulawinv(yh, mu);
   P(i,3) = (i-1)+sqrt(-1)*snr_mcclellan(xh,x);

   %mu-law 1
   yh = fxquant(y, nbits-2, 'round', 'sat');
   xh  =mulawinv(yh, mu);
   P(i,4) = (i-1)+sqrt(-1)*snr_mcclellan(xh,x);

   %mu-law 2
   yh = fxquant(y, nbits-4, 'round', 'sat');
   xh  =mulawinv(yh, mu);
   P(i,5) = (i-1)+sqrt(-1)*snr_mcclellan(xh,x);

   %mu-law 3
   yh = fxquant(y, nbits-6, 'round', 'sat');
   xh  =mulawinv(yh, mu);
   P(i,6) = (i-1)+sqrt(-1)*snr_mcclellan(xh,x);

   x = x/2;
end

plot(P)
title(['Questão 4.2'])

legenda(1) = sprintf("Linear 11b");
legenda(2) = sprintf("Linear 12b");
legenda(3) = sprintf("mu-Law %db",nbits);
legenda(4) = sprintf("mu-Law %db",nbits-2);
legenda(5) = sprintf("mu-Law %db",nbits-4);
legenda(6) = sprintf("mu-Law %db",nbits-6);

legend(legenda(1),legenda(2),legenda(3),legenda(4),legenda(5));
xlabel('power of 2 divisor');   ylabel('SNR in dB')
legend('Location','northeast');
