clc
clear all
close all


imBin = imread('Icroix1.png');
L = size(imBin,1);
C = size(imBin,2);

class(imBin(1))


%B = [1 0 1;
%     0 1 0;
%     1 0 1];

B = logical([0 1 0;
     1 1 1;
     0 1 0]);

%[dC,dL] = meshgrid(-5:5,-5:5);
%B = sqrt(dC.^2 + dL.^2)<5;

%figure(4)
%imshow(double(B))



Bt = transposeMorpho(B);


imRes = myDilate(imBin,B);
imRes2 = imdilate(imBin,Bt);

%original
figure(1)
imshow(imBin)
%print('-dtex','data/tex/dilatationSrc.tex')

%implemented method
figure(2)
imshow (imRes)
%print('-dtex','data/tex/dilatation.tex')

%octave method
figure(3)
imshow (imRes2)
