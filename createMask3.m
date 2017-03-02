function mask = createMask3(mask, fftdImage, shapes)
% Gets the points per shape
points = shapes*2;
[sizeY,sizeX]=size(fftdImage);

%Convert map for image overlay
mask = ~mask;

% display the image to be masked
image(256*log(abs(fftdImage))/max(max(log(abs(fftdImage)))));
colormap(gray(256));

% Grab co-ordinates from the above image
[x,y] = ginput(2);
x = max(x,1); x=min(x,sizeX);
y = max(y,1); y=min(y,sizeY);
disp('The input co-ordinates are: ');
disp('         X, Y');
disp([x,y]);

% remove floating points
x = round(x);
y = round(y);

j = 1;
pointCountcount = 1;
% incremented by 2 because points is twice the size of the needed
% iterations
while(pointCountcount < points)
    % masks out the supplied areas, applies to supplied mask
    mask((y(j)):(y(j+1)),(x(j)):(x(j+1))) = 0;
    mask((sizeY - y(j+1)+1):(sizeY - y(j)+1),(sizeX - x(j+1)+1):(sizeX - x(j)+1)) = 0;
    
    %add mask to fftdImage to see where masks is
    y2 = fftdImage.*mask;
    %display resulting fft of image and mask.
    image(256*log(abs(y2))/max(max(log(abs(y2)))));
    colormap(gray(256));
    
    if(pointCountcount + 2 < points)
        %Get masking points of next shapes from image mask fft
        [x,y] = ginput(2);
        x=max(x,1); x=min(x,sizeX);
        y=max(y,1); y=min(y,sizeY);
        disp([x,y]);

        % remove floating points
        x=round(x);
        y=round(y);
    end
    pointCountcount = pointCountcount + 2;
end

% displays the mask
mask = ~mask;
image(256*mask);
colormap(gray(256));


