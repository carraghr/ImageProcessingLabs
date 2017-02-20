load('FURELISE.MAT');
%fullSong = audioplayer(FE,Fsamp);
%playblocking(fullSong);
f = figure;
set(f,'name','Plot of full song FURELISE.MAT','numbertitle','off');
plot(FE);
f = figure;
set(f,'name','Plot of first 1000 samples','numbertitle','off');
plot(FE(1:1000));
f = figure;
set(f,'name','Plot of first 100 samples','numbertitle','off');
plot(FE(1:100));
%{
   fast fourier transform of wave
%}
y = fft(FE(1:1000));
f = figure;
set(f,'name','Plot fourier transform of first 1000 samples','numbertitle','off');
plot(abs(y));
f = figure;
set(f,'name','Plot fourier transform of first 100 samples','numbertitle','off');
plot(abs(y(1:100)));
f = figure;
w = sin(2*pi*83*(1:100)/1000);
set(f,'name','Plot of wave created','numbertitle','off');
plot(w);
noteCreated = audioplayer(w,Fsamp);
note = audioplayer(FE(1:1000), Fsamp);
playblocking(noteCreated);
playblocking(note);
w = sin(2*pi*83*(1:1000)/1000);
noteCreated = audioplayer(w,Fsamp);
playblocking(noteCreated);
playblocking(note);
w2 = sin(2*pi*166*(1:1000)/1000);
total = w + w2;
totalCreated = audioplayer(total,Fsamp);
playblocking(noteCreated);
playblocking(totalCreated);
total = w + 0.5*w2;
totalCreated = audioplayer(total,Fsamp);
playblocking(noteCreated);
playblocking(totalCreated);
w3 = sin(2*pi*249*(1:1000)/1000);
total = w + 0.5*w2 + 0.25*w3;
newtotalCreated = audioplayer(total,Fsamp);
playblocking(noteCreated);
playblocking(totalCreated);
playblocking(newtotalCreated);