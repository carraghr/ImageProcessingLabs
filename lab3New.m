%colormap(gray(256));

load('archeology.mat');
figure();
colormap(gray(256));
image(archeology)

y = fft2(archeology);
figure();
colormap(gray(256));

mask = zeros(481,638);

image(256*log(abs(y))/max(max(log(abs(y)))));
colormap(gray(256));
mask = createMask3(mask,y,5);

mask = 1 - mask;

y2 = y.*mask;
z = ifft2(y2);
figure();
image(abs(z));
colormap(gray(256));

