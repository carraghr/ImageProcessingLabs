%colormap(gray(256));

load('archeology.mat');
figure();
colormap(gray(256));
image(archeology)

y = fft2(archeology);
figure();
colormap(gray(256));

mask = zeros(481,638);

image(256*log(abs(y)/max(max(log(abs(y))))));

mask = createMask2(mask,y,15);

mask = 1 - mask;

y2 = y.*mask;
z = ifft2(y2);
image(abs(z));


