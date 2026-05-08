load('Material/testeplacaverm.mat')
N = 1000; 

X_fix = filter(1, ones(1,N)/N, double(X)')'; 
X_final = X_fix(:, end:-1:1);

figure;
image(X_final);
colormap("gray");
title('Placa Corrigida');
