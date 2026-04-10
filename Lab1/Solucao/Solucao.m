%% Roteiro 1: Sequências Básicas e Operações com Sinais
clear all; close all; clc;

addpath('./funcoes');

%% --- QUESTÃO 1 ---
% x1: origem no 1 (4ª pos) 
x1q1 = [3, 0, 2, 1, 5, 7, 0, 0, 1, 1, 10];
n1q1 = -3:7; 

% x2: origem no 1 (4ª pos) 
x2q1 = [0, 0, 0, 1, 0, 0];
n2q1 = -3:2;

figure(1);
subplot(2,1,1); stem(n1q1, x1q1, 'filled'); title('Questão 1a'); grid on;
subplot(2,1,2); stem(n2q1, x2q1, 'filled'); title('Questão 1b'); grid on;

%% --- QUESTÃO 2 ---
% Impulsos no intervalo -20 a 20 
[xa_q2, na_q2] = impseq(0, -20, 20); % delta[n]
[xb_q2, nb_q2] = impseq(4, -20, 20); % delta[n-4]

figure(2);
subplot(2,1,1); stem(na_q2, xa_q2, 'filled'); title('Questão 2a: \delta[n]'); grid on;
subplot(2,1,2); stem(nb_q2, xb_q2, 'filled'); title('Questão 2b: \delta[n-4]'); grid on;

%% --- QUESTÃO 3 ---
% Degraus no intervalo -20 a 20 
[xa_q3, na_q3] = stepseq(0, -20, 20); % u[n]
[xb_q3, nb_q3] = stepseq(4, -20, 20); % u[n-4]

figure(3);
subplot(2,1,1); stem(na_q3, xa_q3, 'filled'); title('Questão 3a: u[n]'); grid on;
subplot(2,1,2); stem(nb_q3, xb_q3, 'filled'); title('Questão 3b: u[n-4]'); grid on;

%% --- QUESTÃO 4 ---
% x1: origem no 1 (4ª pos). x2: origem no -4 (1ª pos) 
x1_q4 = [3, 0, 2, 1, 5, 7, 0, 0, 1, 1, 10]; n1_q4 = -3:7;
x2_q4 = [-4, -3, -2, -1, 0, 1, 2, 3, 4];   n2_q4 = 0:8;

figure(4);
[y_soma, n_soma] = sigadd(x1_q4, n1_q4, x2_q4, n2_q4);     
subplot(2,2,1); stem(n_soma, y_soma, 'filled'); title('4a: Soma'); grid on;

[y_mult, n_mult] = sigmult(x1_q4, n1_q4, x2_q4, n2_q4);    
subplot(2,2,2); stem(n_mult, y_mult, 'filled'); title('4b: Multiplicação'); grid on;

[y_shift, n_shift] = sigshift(x1_q4, n1_q4, 4);            
subplot(2,2,3); stem(n_shift, y_shift, 'filled'); title('4c: x1[n-4]'); grid on;

[y_fold, n_fold] = sigfold(x1_q4, n1_q4);                  
subplot(2,2,4); stem(n_fold, y_fold, 'filled'); title('4d: x1[-n]'); grid on;

%% --- QUESTÃO 5 ---
% Sequências compostas conforme expressões do roteiro 
n5a = -5:5;
x5a = 2*(n5a == -2) - 1*(n5a == 4);

n5b = 0:20;
x5b = n5b.*((n5b>=0)-(n5b>=10)) + 10*exp(-0.3*(n5b-10)).*((n5b>=10)-(n5b>=20));

figure(5);
subplot(2,1,1); stem(n5a, x5a, 'filled'); title('Questão 5a'); grid on;
subplot(2,1,2); stem(n5b, x5b, 'filled'); title('Questão 5b'); grid on;

%% --- QUESTÃO 6 ---
% x[n] com origem no 3 (3ª posição) 
x6 = [1,2,3,4,5,6,6,5,4,3,2,1,2]; 
nx6 = -2:10;

figure(6);
[xa1, na1] = sigshift(x6, nx6, 5);
[xa2, na2] = sigshift(x6, nx6, -4);
[x1_q6, n1_q6] = sigadd(2*xa1, na1, -3*xa2, na2);
subplot(2,1,1); stem(n1_q6, x1_q6, 'filled'); title('Questão 6a'); grid on;

[xf, nf] = sigfold(x6, nx6);
[xf_s, nf_s] = sigshift(xf, nf, 3); 
[xs, ns] = sigshift(x6, nx6, 2);
[xm, nm] = sigmult(x6, nx6, xs, ns);
[x2_q6, n2_q6] = sigadd(xf_s, nf_s, xm, nm);
subplot(2,1,2); stem(n2_q6, x2_q6, 'filled'); title('Questão 6b'); grid on;

%% --- QUESTÃO 7 ---
% Convolução baseada nas definições do roteiro 
hq7 = [1, 2, 1]; nhq7 = -1:1;
xq7 = [2, 3, -2]; nxq7 = 0:2;

[y_conv, ny_conv] = conv_m(xq7, nxq7, hq7, nhq7);

figure(7);
stem(ny_conv, y_conv, 'filled'); title('Questão 7: Convolução'); grid on;

