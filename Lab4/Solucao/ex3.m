[sinal, fs] = audioread('romansaSmall.wav');
sinal = sinal(:,1); % canal mono (caso stereo)
N = length(sinal);
X = fft(sinal);

half_N = floor(N/2) + 1;
freq = (0:half_N-1) * fs / N;
X_half = X(1:half_N);

figure;

% Espectro de Amplitude
subplot(2, 1, 1);
plot(freq, abs(X_half)/N, 'b');
ylabel('Amplitude');
xlabel('Frequencia (Hz)');
title('Espectro de Amplitude');
grid on;

% Espectro de Fase (com mascara de tolerancia)
subplot(2, 1, 2);
tolerancia = 1e-5;
fase = angle(X_half);
fase(abs(X_half)/N < tolerancia) = 0;
plot(freq, fase, 'b');
ylabel('Fase (rad)');
xlabel('Frequencia (Hz)');
title('Espectro de Fase');
grid on;