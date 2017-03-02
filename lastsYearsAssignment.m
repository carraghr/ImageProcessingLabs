close all
close all hidden

load('mosaic.mat');
mosaic = imresize(mosaic, [800 800])
image(mosaic);
colormap(gray(256));

y = fft2(mosaic);
figure;
image(256*log(abs(y))/(max(max(log(abs(y))))));
colormap(gray(256));
figure;
surf(256*log(abs(y))/(max(max(log(abs(y))))));
colormap(gray(256));



mask = ones(800,800);
mask(1:10,:) = 0;
mask(799,800,:) = 0;


y2 = y .* mask;

z = ifft2(y2);
figure;
image(256*abs(z)/max(max(abs(z))));
colormap(gray(256));


x = (0:799);
x(674:800)=800-(673:799);
x = x.*x;
dist = x'*ones(1,800);
gau = exp(-dist/20);
gau = 1-gau;
figure;
image(256*gau);
colormap(gray(256));

Y=y.*gau;
z=ifft2(Y);
image(256*abs(z)/max(max(abs(z))))
%{
mask = zeros(569,800);
mask = createMask3(mask,y,2);
mask = 1 - mask;
figure;
image(256*mask);
colormap(gray(256));
y2 = y .* mask;

z = ifft2(y2);
figure;
image(256*abs(z)/max(max(abs(z))));
colormap(gray(256));
%}

