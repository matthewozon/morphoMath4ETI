clc
clear all
close all



imCoinsRGB = imread('piece.jpg');

imCoins = double(rgb2gray(imCoinsRGB));

dl = (1/4)*[-1 -2 -1;
            0  0  0 ;
            1  2  1];

dc = (1/4)*[-1  0  1;
            -2  0  2 ;
            -1  0  1];

gradL = conv2(imCoins,dl,'same');
gradC = conv2(imCoins,dc,'same');

normGrad = sqrt(gradL.^2 + gradC.^2);

figure(1)
subplot(121)
imshow(normGrad/255)
subplot(122)
hist(normGrad(:),20)

thGrad = input("Pick a threshold\n")


imCoinsBin = normGrad>thGrad;


Bfg = [0 0 0; 0 1 0; 0 0 0];
Bbg = [0 1 0; 1 0 1; 0 1 0];


Xb = hitMiss(imCoinsBin,Bfg,Bbg);

imRes = repmat(and(imCoinsBin,not(Xb)), [1 1 3]);
imRes(:,:,1) = imRes(:,:,1) + Xb;


figure(2)
subplot(211)
imshow(double(imCoinsBin))
subplot(212)
imshow(double(imRes))

figure(3)
imshow(double(imRes))
print('-dtex','data/tex/points.tex')






