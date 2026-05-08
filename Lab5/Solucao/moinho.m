X = imread('Figuras/moinho.jpg ','jpg');
Xred = X(:,:,1);
Xgreen = X(:,:,2);
Xblue = X(:,:,3);
Xgreennovo = double(Xgreen)*3;
Xrednovo = double(Xred);
Xbluenovo = double(X(:,:,3));
Xnovo(:,:,1) = uint8(Xrednovo);
Xnovo(:,:,2) = uint8(Xgreennovo);
Xnovo(:,:,3) = uint8(Xbluenovo);
subplot(231);image(X); title('moinho.jpg');
subplot(232);image(Xnovo); title('Cores modificadas');

subplot(233);image(Xred); title('Componente red');
subplot(234);image(Xgreen); title('Componente green');
subplot(235);image(Xblue); title('Componente blue');