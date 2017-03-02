%lab on the 23/2/17
load('objects.mat')
mask = ones(256,256);
mask(1:10,:)=0;
mask(246:256,:)=0;
image(256*mask);
colormap(gray(256));
figure;
image(256*objects);
colormap(gray(256));

figure;
y = fft2(objects);
y = y.*mask;
z = ifft2(y);
image(256*abs(z)/max(max(abs(z))));
colormap(gray(256));

figure;

x = (0:255);
x(130:256) = 256 - (129:255); %x(130:256) = 256 - (129:255);
x = x.*x;

dist = x'*ones(1,256);
gau = exp(-dist/9999); %change last number to adjust the filter was 20
gau = 1 - gau;
image(256*gau);
colormap(gray(256));

figure;
y = fft2(objects);
y = y.*gau;
z = ifft2(y);
image(256*abs(z)/max(max(abs(z))));
colormap(gray(256));

figure;
x = (1:256);
x(129:256)=256-(129:256);
x = x.*x;
x = x' * ones(1,256);
gau = exp(-(x+x')/(2*30*30));
gau = 1-gau ;
image(256*gau)
colormap(gray(256));

figure;
y = fft2(objects);
y = y.*gau;
z = ifft2(y);
image(256*abs(z)/max(max(abs(z))));
colormap(gray(256));

figure;
gau1 = exp(-(x+x')/(2*40*40));
gau2 = exp(-(x+x')/(2*35*35));
gau = gau1 - gau2;
image(256*abs(gau)/max(max(abs(gau))))

figure;
y = fft2(objects);
y = y.*gau;
z = ifft2(y);
image(256*abs(z)/max(max(abs(z))));
colormap(gray(256));
load('leaf.mat')

y = fft2(objects);
for i = 2:20,
gau1 = exp(-(x+x')/(2*i*i));
gau2 = exp(-(x+x')/(2*(i-1)*(i-1)));
gau = gau1-gau2;
figure(3); image(256*abs(gau)/max(max(abs(gau))))
y2 = y.* gau;
xx2=ifft2(y2);
figure(2); image(256*abs(xx2)/max(max(abs(xx2))))
pause
end
