clc
clear all
close all

%load the binary image
imBin = imread('bin.png');

size(imBin)
class(imBin(1))

%create noise
N = randn(300,400)>2.0;
imBinNoisy = xor(imBin,N);

figure(1)
subplot(121)
imshow(double(imBin))
title('Image sans bruit')
subplot(122)
imshow(double(imBinNoisy))
title('Image avec bruit')
print('-dtex','data/tex/debruitageOrigine.tex')


%transform image
B = ones(3);
B  = [0 1 0;
      1 1 1;
      0 1 0];
imFiltered = imopen(imBinNoisy,B); %remove salt
figure(2)
subplot(121)
imshow(double(imBin))
title('Image sans bruit')
subplot(122)
imshow(double(imFiltered))
title('filtrage du fond par ouverture')
print('-dtex','data/tex/debruitageStep1.tex')

imFiltered2 = imclose(imFiltered,B); %remove pepper
figure(3)
subplot(121)
imshow(double(imFiltered2))
title('Image filtree par une ouverture puis fermeture')
subplot(122)
imshow(double(xor(imBin,imFiltered2)))
title('Difference entre image originale et filtree')
print('-dtex','data/tex/debruitageStep2.tex')

figure(4)
subplot(121)
imshow(double(imFiltered))
title('filtrage du fond par ouverture')
subplot(122)
imshow(double(imFiltered2))
title('Image filtree par une ouverture puis fermeture')
print('-dtex','data/tex/debruitageSteps.tex')

%figure(3)
%imshow(abs(double(imBin) - double(imFiltered)) )
