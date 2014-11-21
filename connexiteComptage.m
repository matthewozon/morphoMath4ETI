clc
clear all
close all

[dC,dL] = meshgrid(-5:5,-5:5);
B = sqrt(dC.^2 + dL.^2)<5;


[dC,dL] = meshgrid(-49:50,-49:50);
X = sqrt(dC.^2 + dL.^2)<5;


composanteConnex = (sqrt((dC+5).^2 + dL.^2)<5) | (sqrt(dC.^2 + (dL+10).^2)<5) | (sqrt((dC-15).^2 + dL.^2)<5) | (sqrt((dC+25).^2 + dL.^2)<5) | (sqrt(dC.^2 + (dL-20).^2)<5) | (sqrt(dC.^2 + (dL+30).^2)<5);

imBin = sqrt(dC.^2 + dL.^2)<43;

imBin = and(imBin,not(composanteConnex));




%show image
figure(1)
imshow(double(imBin))


Bfg1 = [1 0 ; 0 0];
Bbg1 = [0 1; 1 1];

X1 = hitMiss(imBin,Bfg1,Bbg1);

Bfg2 = [1 0 ; 0 1];
Bbg2 = [0 1; 1 0];

X2 = hitMiss(imBin,Bfg2,Bbg2);

Bfg3 = [1 1 ; 1 0];
Bbg3 = [0 0; 0 1];

X3 = hitMiss(imBin,Bfg3,Bbg3);


Nc = sum(double(X1(:))) + sum(double(X2(:))) - sum(double(X3(:)));

sprintf("Le nombre de connexite de l'image est %i",Nc)
