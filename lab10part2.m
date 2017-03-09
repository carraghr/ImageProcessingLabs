close all;
close all hidden;
load('ab.mat');
figure;
image(ab);
colormap(gray(256));

y = fft2(ab);
figure;
image(256*abs(y)/max(max(abs(y))));
colormap('default');

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

masky = fft2(mask);
figure;
image(256*log(abs(masky))/max(max(log(abs(masky)))));
colormap(gray(256));

figure;
image(256*log(abs(masky))/max(max(log(abs(masky)))));
colormap('default');

%{

    64*64 mask 
    The mask created by cutting out the B leaving the A

    He just does the max and abs 

    top 1,1 pixel is the middle of mask. It is applied to each point.
    If this point is applied to each of the A then it will start filling in
    the gaps between the bars.


    Because of this the hor lines are removed as they 

    better mask 60-180/190, 0,60

    odd cols are a zeros in stem, if applied to A the odd col has no effect
    to the a white bits. The gaps are filled as 1 is placed there

    rows in B are removed for the same reason black parts are added with 0
    nothing happens but the white bars are hit with 1 so the points around
    it 

Look at this leter 
%}

figure;
stem(real(masky(1,1:10)));

figure;
plot(real(masky(1,1:10)));