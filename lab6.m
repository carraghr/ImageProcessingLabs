%Lab 6

mask = ones(256,256);
mask(1:10,:) = 0;
mask(246:256,:) = 0;
image(256*mask)

load('LENNA.mat');
X = fft2(xx);
figure;
image(xx);
colormap(gray(256));
Y = X .* mask;
y = ifft2(Y);
figure;
image(256*abs(y)/max(max(abs(y))));
colormap(gray(256));

M = ifft2(mask);
figure;
%surf(real(M(:,1)))
plot(real(M(:,1)))