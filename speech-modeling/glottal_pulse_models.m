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
plot(n, gR)
hold on
plot(n, gE)
plot(n, gR_flip)
legend('GR', 'GE', 'GR flip');
hold off

figure
plot(WR, 20*log10(abs(GR)))
hold on
plot(WE, 20*log10(abs(GE)))
plot(WR, 20*log10(abs(GR_flip)))
legend('GR', 'GE', 'GR_flip');
xlabel('Frequency (rad/s)')
ylabel('Log Magnitude in dB')
hold off

rPulsesCases([10, 15, 25], 50, Nfreq);

roots_GR = roots(GR);
roots_GR_flip = roots(GR_flip);

figure
subplot(2,1,1)
zplane([],roots_GR)
subplot(2,1,2)
zplane([],roots_GR_flip)