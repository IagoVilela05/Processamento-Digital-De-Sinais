function x = sinseq(n1,n2) % Senóide
n = n1:0.1:n2;
x = 3*cos(0.1*pi*n + pi/3) + 2*sin(0.5*pi*n);
stem (x); 

end

