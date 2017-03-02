close all;
close all hidden;
load('ab.mat');
figure;
image(ab);
colormap(gray(256));

%
y = fft2(ab);
figure;
image(256*abs(y)/max(max(abs(y))));
colormap('default');

%mask to remove letter B
mask = zeros(256,256);
mask(1:60, 70:200) = 1;
mask(196:256, 70:200) = 1;
%{
    figure;
    image(256*mask);
%}
%mask = 1 - mask;
y2 = y .*mask;
x = ifft2(y2);
figure;
image(256*abs(x)/max(max(abs(x))));
colormap(gray(256));


%mask to remove letter A
mask = zeros(256,256);
mask(100:160, 1:30) = 1;
mask(100:160, 226:256) = 1;
%{
    figure;
    image(256*mask);
%}
%mask = 1 - mask;
y2 = y .*mask;
x = ifft2(y2);
figure;
image(256*abs(x)/max(max(abs(x))));
colormap(gray(256));




load('abdiag.mat');
figure;
image(abdiag);
colormap(gray(256));

%
y = fft2(abdiag);
figure;
image(256*abs(y)/max(max(abs(y))));
colormap('default');

%mask to remove letter A
mask = zeros(256,256);
mask(50:100, 50:100) = 1;
mask(180:220, 170:220) = 1;
%mask = 1 - mask;
y2 = y .*mask;
x = ifft2(y2);
figure;
image(256*abs(x)/max(max(abs(x))));
colormap(gray(256));


%mask to remove letter B
mask = zeros(256,256);
mask(180:220, 50:100) = 1;
mask(50:100, 170:220) = 1;
%mask = 1 - mask;
y2 = y .*mask;
x = ifft2(y2);
figure;
image(256*abs(x)/max(max(abs(x))));
colormap(gray(256));
