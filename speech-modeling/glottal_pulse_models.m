% % % % % % % % % % % % %  1) Comparison of Glottal Pulse Models % % % % % % % % %

a = 0.91;
N1 = 45;
N2 = 5;
Npts = 51;
Nfreq = 100;

[gE, GE, WE] = glottalE(a,Npts,Nfreq);
[gR, GR, WR] = glottalR(N1,N2,Nfreq);
n = 1:Npts;

gR_flip = fliplr(gR);
GR_flip = fft(gR_flip, Nfreq);

figure
subplot(1, 2, 1)
plot(n, gR)
hold on
plot(n, gE)
plot(n, gR_flip)
title("Pulsos Glotais")
legend('g_R', 'g_E', 'g_R flip');
xlabel('n')
hold off

subplot(1, 2, 2)
plot(WR, 20*log10(abs(GR)))
hold on
plot(WE, 20*log10(abs(GE)))
plot(WR, 20*log10(abs(GR_flip)))
legend('GR', 'GE', 'GR_flip');
xlabel('Frequency (rad/s)')
ylabel('Log Magnitude in dB')
title("Resposta em frequência dos modelos de pulso")
hold off

rPulsesCases([10, 15, 25], 50, Nfreq);

coefficients_GR = lpc(gR, 15);
roots1_GR = roots(coefficients_GR);
coefficients_GR_flip = lpc(gR_flip, 15);
roots1_GR_flip = roots(coefficients_GR_flip);

roots2_GR = roots(GR);
roots2_GR_flip = roots(GR_flip);

figure
subplot(2,2,1)
zplane([],roots1_GR)
title("Raizes do pulso GR (usando LPC)")
subplot(2,2,2)
zplane([],roots1_GR_flip)
title("Raizes do pulso GR Flip (usando LPC)")

subplot(2,2,3)
zplane([],roots2_GR)
title("Raizes do pulso GR (uso direto roots())")
subplot(2,2,4)
zplane([],roots2_GR_flip)
title("Raizes do pulso GR Flip (uso direto roots())")