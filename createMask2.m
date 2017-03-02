% Creates a mask from given inputs
% Created by Dan Malone
% Student Number 10375043
% 21-Oct-2013

function mask = createMask2(mask, fftdImage, shapes)
% Gets the points per shape
points = shapes*2;
[sizeY,sizeX]=size(fftdImage);

% display the image to be masked
image(256*log(abs(fftdImage))/max(max(log(abs(fftdImage)))));
colormap(gray(256));

% Grab co-ordinates from the above image
[x,y] = ginput(points);
x=max(x,1); x=min(x,sizeX);
y=max(y,1); y=min(y,sizeY);
disp('The input co-ordinates are: ');
disp('         X, Y');
disp([x,y]);

% remove floating points
x=round(x);
y=round(y);

j = 1;
% incremented by 2 because points is twice the size of the needed
% iterations
while(j < points)
% masks out the supplied areas, applies to supplied mask
    mask((y(j)):(y(j+1)),(x(j)):(x(j+1)))=1;
    mask((sizeY - y(j+1)+1):(sizeY - y(j)+1),(sizeX - x(j+1)+1):(sizeX - x(j)+1))=1;
    
    j = j+2;
end

% displays the mask
image(256*mask);
colormap(gray(256));

