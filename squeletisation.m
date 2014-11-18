clc
clear all
close all

L = 100;
C = 100;
Lrect = 21;
Crect = 61;
l0 = floor((L-Lrect)/2);
c0 = floor((C-Crect)/2);

%image
X = false(L,C);
X( l0:(l0+Lrect-1), c0:(c0+Crect-1)) = true(Lrect,Crect);

%element structurant
%[dC,dL] = meshgrid(-5:5,-5:5);
%B = sqrt(dC.^2 + dL.^2)<5;
B = logical([0 1 0;
     1 1 1;
     0 1 0]);

%squeletisation
S = squelette(X,B);


%resultats
figure(1)
subplot(121)
imshow(double(X));
title('image originale')
subplot(122)
imshow(double(S));
title('squelette')
print('-dtex','data/tex/rectSkel.tex')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%another
imBin = imread('veau2_moins_petit.bmp');

%squeletisation
S = squelette(imBin,B);

%resultats
figure(2)
subplot(121)
imshow(double(imBin))
title('image petit veau')
subplot(122)
imshow(double(S));
title('squelette du petit veau')
print('-dtex','data/tex/veauSkel.tex')

S = bwmorph(imBin , 'skel-lantuejoul',500);
figure(3)
subplot(121)
imshow(double(imBin))
title('image petit veau')
subplot(122)
imshow(double(S));
title('squelette du petit veau par bwmorph')
