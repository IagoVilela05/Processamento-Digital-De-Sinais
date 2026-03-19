function [x, n] = stepseq(n0, n1, n2) % Degrau
n = [n1:n2];
x = [(n-n0) >= 0];
