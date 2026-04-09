[vogais, FS] = audioread ('vogaisc.wav'); 
%Fs = 8000;
%t= 0:(1/Fs):5;
%fa = 1000;
%fb = 2000;

%f = fa + t.*(fb - fa);

%x = sin(2*pi.*f.*t);
x = vogais (:, 1);
%y = x(1:2:end);
soundsc(vogais, FS)
spectrogram(x,128,120,128,8000,'yaxis');



