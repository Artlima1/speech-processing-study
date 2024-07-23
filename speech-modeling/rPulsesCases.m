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
for k = 1:ncases
    plot(1:NSum+1, gR(k,:))
    hold on
end
hold off

figure
for k = 1:ncases
    plot(W(k,:), abs(GR(k,:)))
    hold on
end
hold off

