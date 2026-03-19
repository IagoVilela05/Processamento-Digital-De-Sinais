function [x, n] = impseq(n0, n1, n2) % Impulso
n = [n1:n2];
x = [(n-n0) == 0];
