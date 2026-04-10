%% LAB: Processamento Digital de Sinais - Ilustrando Aliasing
clear; clc; close all;

%% Passo 1: Construção do sinal de chirp
disp('Passo 1: Tocando o sinal chirp original...');
Fs = 8000; 
T = 1/Fs;  
t = 0:T:5; 

fa = 1000; 
fb = 2000; 
f = fa + t .* (fb - fa); 
x = sin(2 * pi .* f .* t);

soundsc(x, Fs);

% Duração do áudio + 1 segundo de intervalo
pause(length(x)/Fs + 1);


%% Passo 2: Construção do espectrograma 
figure('Name', 'Passo 2 - Espectrograma Original'); 
spectrogram(x, 128, 120, 128, Fs, 'yaxis');
title('Passo 2: Espectrograma do sinal original x(n)');


%% Passo 3: Subamostragem / Decimação do sinal
disp('Passo 3 e 4: Tocando o sinal chirp subamostrado (y(n) = x(2n))...');
y = x(1:2:end);
Fs_y = Fs / 2; % 4000 Hz

soundsc(y, Fs_y);

figure('Name', 'Passos 3 e 4 - Espectrograma Subamostrado');
spectrogram(y, 128, 120, 128, Fs_y, 'yaxis');
title('Passos 3 e 4: Espectrograma do sinal subamostrado y(n)');

pause(length(y)/Fs_y + 1);


%% Passo 4: Carregar e ouvir o arquivo de áudio real
disp('Passo 5: Tocando o arquivo original vogais.wav...');
[vogais, FS_audio] = audioread('vogaisc.wav');
x_audio = vogais(:, 1); 

disp([' -> Frequência de amostragem do arquivo: ', num2str(FS_audio), ' Hz']);
soundsc(x_audio, FS_audio);

pause(length(x_audio)/FS_audio + 1);


%% Passo 5: Decimação por 10 vezes (SEM Filtro)
disp('Passo 6: Tocando decimação por 10 SEM filtro (Ruído/Arranhado)...');
fator = 10;
Fs_nova = FS_audio / fator; 
x_pobre = x_audio(1:fator:end);

soundsc(x_pobre, Fs_nova);

pause(length(x_pobre)/Fs_nova + 1);


%% Passo 6: Filtragem Anti-Aliasing e Decimação (COM Filtro)
disp('Passo 7: Tocando decimação por 10 COM filtro (Abafado, mas limpo)...');
% Filtro FIR passa-baixa para remover componentes acima da nova Freq de Nyquist
z = filter(fir1(100, 0.1), 1, x_audio);

z_bom = z(1:fator:end);

soundsc(z_bom, Fs_nova);

disp('Atividade finalizada!');
