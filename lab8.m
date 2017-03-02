%lab on the 27/2/17

%chage the boxs in the mask to see what heppens
load('marilyn.mat');
image(marilyn);
colormap(gray(256));

Y = fft2(marilyn);
figure;
image(256*log(abs(Y))/(max(max(log(abs(Y))))));
colormap(gray(256));

mask = zeros(407,446);
mask(1:30,1:30) = 1;
mask(377:407,1:30) = 1;
mask(377:407,416:446) = 1;
mask(1:30,416:446) = 1;

X = Y .*mask;
x = ifft2(X);
figure;
image(256*abs(x)/max(max(abs(x))));
colormap(gray(256));

%part 2

load('LENNA.mat');
xx2 = zeros(512,512);
xx2(1:2:512, 1: 2: 512)=xx;
figure;
image(xx2);
colormap(gray(256));

y = fft2(xx2);
figure;
image(256*log(abs(y))/max(max(log(abs(y)))));
colormap(gray(256));

mask = zeros(512,512);
mask(128:384, 128:384) = 1;
figure;
image(256*mask);
colormap(gray(256));

y2 = y .* mask;
z = ifft2(y2);
figure;
image(256*abs(z)/max(max(abs(z))));
colormap(gray(256));

xx2 = zeros(1024,1024);
xx2(1:4:1024, 1:4:1024)=xx;
figure;
image(xx2);
colormap(gray(256));

y = fft2(xx2);
figure;
image(256*log(abs(y))/max(max(log(abs(y)))));
colormap(gray(256));

mask = zeros(1024,1024);
%mask(128:384, 128:384) = 1;
createMask3(mask,y,5);
mask = 1 - mask;
figure;
image(256*mask);
colormap(gray(256));

y2 = y .* mask;
z = ifft2(y2);
figure;
image(256*abs(z)/max(max(abs(z))));
colormap(gray(256));