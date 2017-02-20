%lab on 16/2/17

load('lenna');
h = ones(10,10);
xcon=conv2(xx,h);
image(256*xcon/max(max(xcon)));
colormap(gray(256));

figure;

h = zeros(265,265);
h(1:10, 1:10) = 1;
H = fft2(h);
H(abs(H) < 0.00001) = 1;
Y = fft2(xcon);
X = Y ./ H;
x = ifft2(X);
image(265*abs(x)/max(max(abs(x))));
colormap(gray(256));

figure;

xnoise = xcon + 10*randn(265,265);
Y = fft2(xnoise);
X = Y ./ H;
x = ifft2(X);
image(265*abs(x)/max(max(abs(x))));
colormap(gray(256));

figure;
plot(abs(Y(128,:)));
figure;
plot(abs(Y(50:200)));

prompt = 'Filter out anything below \n';
N = input(prompt);
Y(abs(Y) < N) = 0;

image(256*log(abs(Y))/max(max(log(abs(Y)))));

X = Y ./ H;
x = ifft2(X);
image(256*abs(x)/max(max(abs(x))));
colormap(gray(256));

%Second part;
figure;
load('annulus');
image(annulus);
colormap(gray(256));

figure;
load('disc');
image(disc);
colormap(gray(256));

Y = fft2(annulus);
H = fft2(disc);
X = Y./H;
x = ifft2(X);
figure;
image(265*abs(x)/max(max(abs(x))))
colormap(gray(256));