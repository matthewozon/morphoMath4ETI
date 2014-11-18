clc
clear all
close all



wodka = imread('DSC05835_bin.tif');

wodka = wodka(700:1300,700:1300);




Bfg = [0 0 0; 0 1 0; 0 0 0];
Bbg1 = [1 1 1;
	1 0 1; 
	1 0 1];
Bbg2 = [1 1 1;
	1 0 1; 
	1 1 0];
Bbg3 = [1 1 1;
	1 0 0; 
	1 1 1];
Bbg4 = [1 1 0;
	1 0 1; 
	1 1 1];
Bbg5 = [1 0 1;
	1 0 1; 
	1 1 1];
Bbg6 = [0 1 1;
	1 0 1; 
	1 1 1];
Bbg7 = [1 1 1;
	0 0 1; 
	1 1 1];
Bbg8 = [1 1 1;
	1 0 1; 
	0 1 1];


Xb1 = hitMiss(wodka,Bfg,Bbg1);
Xb2 = hitMiss(wodka,Bfg,Bbg2);
Xb3 = hitMiss(wodka,Bfg,Bbg3);
Xb4 = hitMiss(wodka,Bfg,Bbg4);
Xb5 = hitMiss(wodka,Bfg,Bbg5);
Xb6 = hitMiss(wodka,Bfg,Bbg6);
Xb7 = hitMiss(wodka,Bfg,Bbg7);
Xb8 = hitMiss(wodka,Bfg,Bbg8);


Xb = or(Xb1,Xb2,Xb3,Xb4,Xb5,Xb6,Xb7,Xb8);

Xb = myDilate(Xb,logical(ones(3)));
%wodka = myDilate(wodka,logical(ones(3)));

imRes = repmat(and(wodka,not(Xb)), [1 1 3]);
imRes(:,:,1) = imRes(:,:,1) + Xb;


figure(1)
imshow(double(imRes))
print('-dtex','data/tex/wodka.tex')


