% % % % % % % % % % % % %  2.1) Frequency Response and Pole-Zero Plot % % % % % % % % %
%TODO

Fs = 10000;
rN = 0.71;
vowell_AA = [1.6, 2.6, 0.65, 1.6, 2.6, 4, 6.5, 8, 7, 5];
vowell_IY = [2.6, 8, 10.5, 10.5, 8, 4, 0.65, 0.65, 1.3, 3.2];

[r_AA, D_AA, G_AA] = atov(vowell_AA, rN);
[r_AA_lossless, D_AA_lossless, G_AA_lossless] = atov(vowell_AA, 1);
[V_AA,w_AA] = freqz(G_AA,D_AA,Fs);
[V_AA_lossless,w_AA_lossless] = freqz(G_AA_lossless,D_AA_lossless,Fs);

[r_IY, D_IY, G_IY] = atov(vowell_IY, rN);
[r_IY_lossless, D_IY_lossless, G_IY_lossless] = atov(vowell_IY, 1);
[V_IY,w_IY] = freqz(G_IY,D_IY,Fs);
[V_IY_lossless,w_IY_lossless] = freqz(G_IY_lossless,D_IY_lossless,Fs);

figure
subplot(2,1,1)
plot(w_AA, 20*log10(abs(V_AA)));
hold on
plot(w_AA_lossless, 20*log10(abs(V_AA_lossless)));
hold off

subplot(2,1,2)
plot(w_IY, 20*log10(abs(V_IY)));
hold on
plot(w_IY_lossless, 20*log10(abs(V_IY_lossless)));
hold off

figure
zplane(D_AA, D_AA_lossless);

% % % % % % % % % % % % %  2.2) Finding Model from the System Function % % % % % % % % %
%TODO
A1 = 1;
D = [1, -0.0460, -0.6232, 0.3814, 0.2443, 0.1973, 0.2873, 0.3655, -0.4806, -0.1153, 0.7100];

[r, A] = VtoA(D, A1)

