Fs = 10000;
f0 = 100;
N = 1000;

period = Fs / f0;
e = zeros(1, N);
indices = 1:period:N;
e(indices) = 1;


