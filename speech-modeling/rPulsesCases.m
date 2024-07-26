function rPulsesCases(nN2, NSum, Nfreq)

ncases = length(nN2);
nN1 = NSum - nN2;

gR = zeros(ncases, NSum+1);
GR = zeros(ncases, Nfreq);
W = zeros(ncases, Nfreq);

for k = 1:ncases
    [gR(k,:), GR(k,:), W(k,:)] = glottalR(nN1(k), nN2(k), Nfreq);
end

figure
subplot(1, 2, 1)
for k = 1:ncases
    plot(1:NSum+1, gR(k,:))
    hold on
end
legend(string(nN2))
xlabel('n')
ylabel('gR[n]')
title(sprintf('g_R[n] for different N2 values with N1+N2=%d', NSum))
hold off

subplot(1, 2, 2)
for k = 1:ncases
    plot(W(k,:), 20*log10(abs(GR(k,:))))
    hold on
end
legend(string(nN2))
xlabel('Frequency (rad/s)')
ylabel('Log Magnitude in dB')
title(sprintf('Frequency Response of g_R[n] for different N2 values with N1+N2=%d', NSum))
hold off


