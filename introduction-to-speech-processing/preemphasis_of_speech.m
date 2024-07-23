% % % % % % % % % Ex2.1 Preliminary analysis % % % % % % % % % % % %

% Determine Analytical expression for impulse response
% H(z) = 1 / (1 - alpha*z^-1)
% h[n] = alpha^n * u[n] 

b = 1;
a1 = [1 -0.5];
a2 = [1 -0.9];
a3 = [1 -0.98];
Fs = 8000;

[h1, w1] = freqz(b, a1, 1024, Fs);
[h2, w2] = freqz(b, a2, 1024, Fs);
[h3, w3] = freqz(b, a3, 1024, Fs);

figure;
plot(w1/pi, 20*log10(abs(h1))); 
hold on;
plot(w2/pi, 20*log10(abs(h2)));
plot(w3/pi, 20*log10(abs(h3)));

title('Frequency Responses for Different Alpha Values');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

legend('Alpha = 0.5', 'Alpha = 0.9', 'Alpha = 0.98');
grid on;
hold off;

% How should alpha be chosen so that the high frequencies will be
% "boosted"? 
% Alpha has to be negative

% % % % % % % % % Ex2.2 Filter and Conv % % % % % % % % % % % %

load ../mcclellan\mcclellan\Data\s5.mat
len = length(s5);
n = (1:len)';

Y1 = filter([1 -0.98], 1, s5);

h = zeros(1, len);
for i = 1:len
    h(n) = 0.98^i;
end
Y2 = conv(s5, h, "same");

figure;
subplot(2,1,1);
plot(n, Y1);
subplot(2,1,2);
plot(n, Y2);

% % % % % % % % % Ex2.3 Plotting Preemphasized Signal % % % % % % % % % % 

figure;
striplot(Y1, Fs, 2000, 100);
figure;
striplot(s5, Fs, 2000, 100);

sound(s5, Fs);
pause(3);
sound(Y1, Fs);
