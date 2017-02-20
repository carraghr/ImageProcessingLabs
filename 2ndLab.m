wavey = exp(2*pi*j*4*(0:255)/255);
wavex = exp(2*pi*j*3*(0:255)/255);
wave2D = wavey * wavex;
surf(real(wave2D));
colormap('default');
image(128*(1+real(real(wave2D))))