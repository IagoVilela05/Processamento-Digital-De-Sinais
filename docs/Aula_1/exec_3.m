close all
clear
clc

% Configurações de amostragem
fs = 60;                        % Frequência de amostragem (60 Hz)
t = 0:1/fs:3;                  % Vetor tempo de 0 a 3 segundos
N = length(t);                 % Tamanho do vetor tempo

% Geração do sinal
f = 1000;                         % Frequência do sinal (5 Hz)
sinal = 5 * sin(2*pi*f*t);     % Sinal senoidal de 5 Hz com amplitude 2

% Plot no domínio do Tempo
subplot(2,1,1);
plot(t, sinal);
title('Sinal Senoidal de 1000 Hz (Domínio do Tempo)');
xlabel('Tempo (s)');
ylabel('Amplitude (V)');

% Cálculo da FFT (Domínio da Frequência)
y = fft(sinal);                % Calcula a Transformada de Fourier
y = y(1:floor(length(y)/2));   % Pega apenas a primeira metade (frequências positivas)

% Ajuste do eixo de frequência
freq = (0:N-1) * fs/N;
freq = freq(1:floor(length(freq)/2));
length(sinal)
% Plot no domínio da Frequência
subplot(2,1,2);
plot(freq, abs(y));            % Plota a magnitude do sinal
title('Espectro do sinal (Domínio da Frequência)');
ylabel('|y(f)|');
xlabel('Frequência (Hz)');