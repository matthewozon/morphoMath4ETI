clc
clear all
close all


%dilatation liee a la carte de distance
veal = logical(imread('veau2_moins_petit.bmp'));

%boule de rayon 5
[dC,dL] = meshgrid(-5:5,-5:5);
B = sqrt(dC.^2 + dL.^2)<5;

%dilatation
vealD = myDilate(veal,B);


%carte de distance
vealDist = bwdist(veal);


figure(1)
subplot(221)
imshow(double(veal))
title('Image originale')

subplot(222)
imshow(double(vealD))
title('Image dilatee par une boule de rayon 5')

subplot(223)
imagesc(double(vealDist))
title('carte de distance')


subplot(224)
imshow(double(vealDist<5))
title('Seuillage de la carte de distance... dilatation')

figure(1)
print('-dtex','data/tex/distanceAndDilatation.tex')
