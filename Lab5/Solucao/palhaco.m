load clown.mat

whos
N = 25;
Xolho = X(50:100, 150:250);
Xnariz = X(90:160, 15:130);
Yvert = filter(ones(1,N)/N,1, X);
subplot(231);image(Yvert);
colormap(map);
Yhori = filter(ones(1,N)/N,1, X');
Yhori = Yhori';
subplot(232);image(Yhori);colormap(map);
Yvolta = filter(1, ones(1,N)/N, Yvert);
Yvolta_hori = filter(1, ones(1,N)/N, Yhori');
Yvolta_hori = Yvolta_hori';
subplot(233);image(Yvolta);colormap(map);
subplot(234);image(Yvolta_hori);colormap(map);
subplot(235); image(Xnariz)

