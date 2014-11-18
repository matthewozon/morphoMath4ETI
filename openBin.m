clc
clear all
close all


imBin = imread('Icroix1.png');


B = [0 1 0;
     1 1 1;
     0 1 0];

imO = imOpen(imBin,B);
imC = imClose(imBin,B);


figure(1)
imshow (imBin)

figure(2)
imshow (imO)

figure(3)
imshow (imC)


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

figure(7)
subplot(121)
imshow(normGrad/255)
subplot(122)
hist(normGrad(:),20)

thGrad = input("Pick a threshold\n")


imCoinsBin = normGrad>thGrad;

%B = ones(3);

%[dC,dL] = meshgrid(-5:5,-5:5);
%B = sqrt(dC.^2 + dL.^2)<5;

imC = myClose(imCoinsBin,B);
imO = myOpen(imCoinsBin,B);

imC2 = imclose(imCoinsBin,B);
imO2 = imopen(imCoinsBin,B);



figure(4)
imshow (imCoinsBin)

figure(5)
imshow (imO)

figure(6)
imshow (imC)

figure(7)
imshow (imO2)

figure(8)
imshow (imC2)


figure(10)
subplot(311)
imshow(imCoins/255.0)
title('image originale')


subplot(312)
imshow(normGrad/255)
title('Norme du gradient')


subplot(313)
imshow(imCoinsBin)
title('Contours')

print('-dtex','data/tex/piece.tex')




figure(11)
subplot(211)
imshow(imO)
title('Ouverture')

subplot(212)
imshow(imC)
title('Fermeture')

print('-dtex','data/tex/pieceOF.tex')

