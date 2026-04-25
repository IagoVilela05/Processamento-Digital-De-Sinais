fs = 8000;               
N = 1000;                
n = 0:N-1;               

x = 2*sin(2000*pi*n/fs); 

X = fft(x);
X_mag = abs(X)/N;        

psd = (abs(X).^2) / (N*fs); 

half_N = floor(N/2) + 1;
freq = (0:half_N-1) * fs / N;

figure;
subplot(2,1,1);
plot(freq, X_mag(1:half_N));
grid on;

subplot(2,1,2);
plot(freq, psd(1:half_N));
grid on;