%exercise of creating two waves and adding them together

%change values for waves 

%first wave was from notes as 4 and 3
wavey = exp(2*pi*j*12*(0:255)/255);
wavex = exp(2*pi*j*12*(0:255)/255);
wave2D = wavey'*wavex;

figure(); %figure allows more then one window at a time.
surf(real(wave2D)) %2d/3d view of an wave. 

figure();
colormap(gray(256)); % change colormap to grayscale. default is rainbow 
image(128*(1+real(real(wave2D))))

%second wave
wavey2 = exp(2*pi*j*5*(0:255)/255);
wavex2 = exp(2*pi*j*6*(0:255)/255);
wave2D2 = wavey2'*wavex2;
figure();
surf(real(wave2D2))

figure();
colormap(gray(256));
image(128*(1+real(real(wave2D2))))

%create a wave with the two before now. See result
figure();
totalWave = wave2D +wave2D2;
surf(real(totalWave))
figure();
colormap(gray(256));
image(128*(1+real(real(totalWave))))



%LENNA examples eveything from notes

load('LENNA.MAT');
y = fft2(xx);
figure();
colormap(gray(256));
image(256*log(abs(y)/max(max(log(abs(y))))))
surf(real(y))

%low pass filter of image 
%corners have high level details so a low pass blocks this.
figure();
mask = zeros(256,256);
mask(1:30,1:30) = 1;
mask(1:30,226:256) = 1;
mask(226:256,1:30) = 1;
mask(226:256,226:256) = 1;
image(256*mask);

y2 = y .* mask;
z = ifft2(y2);
figure();
image(256*log(abs(z)/max(max(log(abs(z))))))
figure();
colormap(gray(256));
image(256*(abs(z)/max(max((abs(z))))))

%high pass filter of image
mask = 1 - mask;
y2 = y .* (mask);
z = ifft2(y2);
figure();
colormap(gray(256));
image(256*(abs(z)/max(max((abs(z))))));

y2 = y + y2;
z = ifft2(y2);
figure();
colormap(gray(256));
image(256*(abs(z)/max(max((abs(z))))));