clc
clear all
close all


%detection de contour par gradient morpho
brake = imread('disque_frein_bin.tif');
brake = brake(1:4:end,1:4:end);
[dC,dL] = meshgrid(-5:5,-5:5);
B = sqrt(dC.^2 + dL.^2)<5;
B = [0 1 0;
     1 1 1;
     0 1 0];
brakeD = myDilate(brake,B);
brakeE = myErode(brake,B);

brakeGrad = brakeD - brakeE;


imRes = repmat(and(brake,not(brakeGrad)), [1 1 3]);
imRes(:,:,1) = imRes(:,:,1) + brakeGrad;


figure(1)
imshow(double(imRes))
title('gradient morphologique')
print('-dtex','data/tex/gradient.tex')



%une autre methode avec la transphormee hit or miss
Bfg = [0 0 0; 0 1 0; 0 0 0];
Bbg1 = [0 1 0;
	0 0 0; 
	0 0 0];
Bbg2 = [0 0 0;
	1 0 0; 
	0 0 0];
Bbg3 = [0 0 0;
	0 0 0; 
	0 1 0];
Bbg4 = [0 0 0;
	0 0 1; 
	0 0 0];



Xb1 = hitMiss(brake,Bfg,Bbg1);
Xb2 = hitMiss(brake,Bfg,Bbg2);
Xb3 = hitMiss(brake,Bfg,Bbg3);
Xb4 = hitMiss(brake,Bfg,Bbg4);


Xb = or(Xb1,Xb2,Xb3,Xb4);

imRes = repmat(and(brake,not(Xb)), [1 1 3]);
imRes(:,:,1) = imRes(:,:,1) + Xb;


figure(2)
imshow(double(imRes))
title('Hit or Miss method')
print('-dtex','data/tex/contour.tex')

