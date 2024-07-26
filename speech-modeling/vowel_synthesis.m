% % % % % % % % % % % % %  3.1) Periodic Vowel Synthesis % % % % % % % % %

Fs = 10000;
f0 = 100;
N = 1000;

a = 0.91;
N1 = 45;
N2 = 5;
Npts = 51;
Nfreq = 500;

vowell_AA = [1.6, 2.6, 0.65, 1.6, 2.6, 4, 6.5, 8, 7, 5];
vowell_IY = [2.6, 8, 10.5, 10.5, 8, 4, 0.65, 0.65, 1.3, 3.2];

period = Fs / f0;
e = zeros(1, N);
indices = 1:period:N;
e(indices) = 1;

R = [1 -1]; % (1 - z^-1)

[gE, GE, WE] = glottalE(a,Npts,Nfreq);
[gR, GR, WR] = glottalR(N1,N2,Nfreq);
gR_flip = fliplr(gR);
GR_flip = fft(gR_flip, Nfreq);

[r_AA, D_AA, G_AA] = atov(vowell_AA, 1);
[r_IY, D_IY, G_IY] = atov(vowell_IY, 1);

s_GE_AA = filter(R, 1, filter(D_AA, G_AA, conv(e, gE, "same")));
s_GR_AA = filter(R, 1, filter(D_AA, G_AA, conv(e, gR, "same")));
s_GRflip_AA = filter(R, 1, filter(D_AA, G_AA, conv(e, gR_flip, "same")));

s_GE_IY = filter(R, 1, filter(D_IY, G_IY, conv(e, gE, "same")));
s_GR_IY = filter(R, 1, filter(D_IY, G_IY, conv(e, gR, "same")));
s_GRflip_IY = filter(R, 1, filter(D_IY, G_IY, conv(e, gR_flip, "same")));

figure
subplot(3,2,1)
plot(s_GE_AA)
title("S = E x G_E x V_{AA} x R")

subplot(3,2,3)
plot(s_GR_AA)
title("S = E x G_R x V_{AA} x R")

subplot(3,2,5)
plot(s_GRflip_AA)
title("S = E x G_{Rflip} x V_{AA} x R")

subplot(3,2,2)
plot(s_GE_IY)
title("S = E x G_E x V_{IY} x R")

subplot(3,2,4)
plot(s_GR_IY)
title("S = E x G_R x V_{IY} x R")

subplot(3,2,6)
plot(s_GRflip_IY)
title("S = E x G_{Rflip} x V_{IY} x R")


% % % % % % % % % % % % %  3.2) Frequency Response of Vowell Synthesizer % % % % % % % % %

[V_AA, W_AA] = freqz(D_AA,G_AA, Nfreq);
[Rz, W_Rz] = freqz(1,R, Nfreq);

H = GR * V_AA * Rz;
figure;
plot(20*log(abs(H)));
xlabel('Frequency (rad/s)')
ylabel('Log Magnitude in dB')
title("H(z)")

% % % % % % % % % % % % %  3.3) Short Time Fourier Transform of Synthetic Vowel % % % % % % % % %

segmentLength = 401;
segment = s_GR_AA(1:segmentLength);
hammingWindow = hamming(segmentLength);
windowedSegment = segment .* hammingWindow';
Y = fft(windowedSegment);

figure
plot(20*log(abs(Y)))
xlabel('Frequency (rad/s)')
ylabel('Log Magnitude in dB')
title("FFT de \a\ sintetizada")


% % % % % % % % % % % % %  3.4) Noise Excitation % % % % % % % % %

noise = randn(1,1000);

noise_AA = filter(R, 1, filter(D_AA, G_AA, noise));

s_noise_GR_AA = s_GR_AA + noise_AA;
figure
plot(s_noise_GR_AA);

segmentLength = 401;
segment = s_noise_GR_AA(1:segmentLength);
hammingWindow = hamming(segmentLength);
windowedSegment = segment .* hammingWindow';
Y_noise = fft(windowedSegment);

figure
plot(20*log(abs(Y_noise)))
xlabel('Frequency (rad/s)')
ylabel('Log Magnitude in dB')
title("FFT \a\ sintetizada com ruído")