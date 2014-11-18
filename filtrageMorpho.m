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
subplot(122)
imshow(double(imBinNoisy))


%transform image
B = ones(3);
B  = [0 1 0;
      1 1 1;
      0 1 0];
imFiltered = imopen(imBinNoisy,B); %remove salt
figure(2)
subplot(121)
imshow(double(imBin))
subplot(122)
imshow(double(imFiltered))
imFiltered = imclose(imFiltered,B); %remove pepper
figure(3)
subplot(121)
imshow(double(imFiltered))
subplot(122)
imshow(double(xor(imBin,imFiltered)))

%figure(3)
%imshow(abs(double(imBin) - double(imFiltered)) )
