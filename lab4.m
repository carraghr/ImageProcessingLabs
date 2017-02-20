%next image for lab

load('field.mat');
image(field);
colormap(gray(256));
y = fft2(field);
image(256*log(abs(y))/max(max(log(abs(y)))));

mask = zeros(356, 530);

mask = createMask2(mask, y , 5);

mask = mask - 1;

y2 = y.*mask;
z = ifft2(y2);
image(abs(z));