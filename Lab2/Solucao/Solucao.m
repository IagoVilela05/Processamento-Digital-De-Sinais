b = [0 0 0 0.25 -0.5 0.0625];
a = [1 -1 0.75 -0.25 0.0625];
[R, p, C] = residuez(b,a)

[delta,n] = impseq(0,0,7)
x = filter (b, a , delta)

stem(x)

c = [2, 3];
d = [1 -1 0.81];

[delta1, n1] = impseq(0, 0, 19)
x1 = filter(c,d, delta1)

stem(x1)

e = [1 -1 4 4];
f = [1 2.75 1.625 -0.25];
[R1, p1, C1] = residuez(e,f)

g = [1 -1 1];
h = [1 -3 2];
[R2, p2, C2] = residuez(g,h)

