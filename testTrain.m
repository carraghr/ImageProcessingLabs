close all
close all hidden

load('field.mat');
figure;
image(field);
colormap(gray(256));

y = fft2(field);
figure;
image(256*log(abs(y))/max(max(log(abs(y)))));
colormap(gray(256));

mask = zeros(356, 530);

mask = createMask3(mask, y , 4);

mask = 1 - mask;
figure;
image(256*mask);
colormap(gray(256));

y2 = y.*mask;

z = ifft2(y2);
figure;
image(256*abs(z)/max(max(abs(z))));
colormap(gray(256));
