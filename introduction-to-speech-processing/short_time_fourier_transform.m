% % % % % % % % % Ex3.1 Effect of Window Length % % % % % % % % % % % %

load ../mcclellan\mcclellan\Data\s5.mat
s5_filt = filter([1 -0.98], 1, s5);

figure

subplot(3, 2, 1)
speccomp(s5, 3750, [401, 201, 101, 51], 512, 30)
title('Short-Time Spectra in Different Window Lengths: ncenter=3750, original signal');
subplot(3, 2, 2)
speccomp(s5_filt, 3750, [401, 201, 101, 51], 512, 30)
title('Short-Time Spectra in Different Window Lengths: ncenter=3750, filtered signal');

subplot(3, 2, 3)
speccomp(s5, 16100, [401, 201, 101, 51], 512, 30)
title('Short-Time Spectra in Different Window Lengths: ncenter=16100, original signal');
subplot(3, 2, 4)
speccomp(s5_filt, 16100, [401, 201, 101, 51], 512, 30)
title('Short-Time Spectra in Different Window Lengths: ncenter=16100, filtered signal');

subplot(3, 2, 5)
speccomp(s5, 17200, [401, 201, 101, 51], 512, 30)
title('Short-Time Spectra in Different Window Lengths: ncenter=17200, original signal');
subplot(3, 2, 6)
speccomp(s5_filt, 17200, [401, 201, 101, 51], 512, 30)
title('Short-Time Spectra in Different Window Lengths: ncenter=17200, filtered signal');

% É possível perceber claramente o aumento da resolução em frequência com o
% aumento do tamanho da janela, embora isso diminua a resolução temporal.

% % % % % % % % % Ex3.2 Effect of Window Position % % % % % % % % % % % %

figure
subplot(3, 2, 1)
stspect(s5,3750,200,401,512,10,20)
title('Short-Time Spectra in Different n values: ncenter=3750, original signal');
subplot(3, 2, 2)
stspect(s5_filt,3750,200,401,512,10,20)
title('Short-Time Spectra in Different n values: ncenter=3750, filtered signal');

subplot(3, 2, 3)
stspect(s5,16100,200,401,512,10,20)
title('Short-Time Spectra in Different n values: ncenter=16100, original signal');
subplot(3, 2, 4)
stspect(s5_filt,16100,200,401,512,10,20)
title('Short-Time Spectra in Different n values: ncenter=16100, filtered signal');

subplot(3, 2, 5)
stspect(s5,17200,200,401,512,10,20)
title('Short-Time Spectra in Different n values: ncenter=17200, original signal');
subplot(3, 2, 6)
stspect(s5_filt,17200,200,401,512,10,20)
title('Short-Time Spectra in Different n values: ncenter=17200, filtered signal');

% É possível perceber nos gráficos, especialmente com ncenter=16100, a forma como o 
% filtro evidencia altas frequências, principalmente pelo efeito de amortecimento
% das frequências mais baixas.
