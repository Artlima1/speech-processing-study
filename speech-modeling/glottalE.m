function  [gE, GE, W] = glottalE(a, Npts, Nfreq)
% g[n] = -e*ln(a)*n*a^n*u[n]
 
gE = zeros(1, Npts);

for i = 1:Npts
    gE(i) = -1 * exp(1) * log(a) * i * a^i;
end

GE = fft(gE, Nfreq);
W = 0:pi/Nfreq:(1-1/Nfreq)*pi;