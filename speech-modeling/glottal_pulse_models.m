a = 0.91;
N1 = 40;
N2 = 10;
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
hold off

figure
plot(WR, abs(GR))
hold on
plot(WE, abs(GE))
plot(WR, abs(GR_flip))
hold off

rPulsesCases([10, 15, 25], 50, Nfreq);

roots_GR = roots(GR);
roots_GR_flip = roots(GR_flip);

figure
subplot(2,1,1)
zplane([],roots_GR)
subplot(2,1,2)
zplane([],roots_GR_flip)