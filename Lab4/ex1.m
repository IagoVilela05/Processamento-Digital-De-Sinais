fs = 200;               
Ts = 1/fs;              
n = 0:99;               
N = length(n);

x1 = cos(2*pi*20*n*Ts + pi/4) + ...
     3*cos(2*pi*40*n*Ts + 2*pi/5) + ...
     2*cos(2*pi*60*n*Ts + pi/8);

X = fft(x1);

half_N = floor(N/2) + 1;
X_half = X(1:half_N);
freq = (0:half_N-1) * fs / N; 

figure;
subplot(2,1,1);
stem(freq, abs(X_half)/N * 2); 
grid on;

subplot(2,1,2);
fase = angle(X_half);
fase(abs(X_half) < 1e-5) = 0; 
stem(freq, fase);
grid on;