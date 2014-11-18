clc
clear all
close all


imBin = imread('Icroix1.png');


B = logical([0 1 0;
     1 1 1;
     0 1 0]);

%B = true;

%[dC,dL] = meshgrid(-5:5,-5:5);
%B = sqrt(dC.^2 + dL.^2)<5;

imErode = myErode(imBin,B);

imErode2 = imerode(imBin,B);

figure(1)
imshow (imBin)
%print('-dtex','data/tex/erosionSrc.tex')

figure(2)
imshow (imErode)
%print('-dtex','data/tex/erosion.tex')

figure(3)
imshow(imErode2)
