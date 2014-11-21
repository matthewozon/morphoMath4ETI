clc
clear all
close all


%detection de contour par gradient morpho
dentelleDuCygneRGB = imread('NGC6960_24Juillet2006_LD.jpg');

dentelleDuCygne = double(rgb2gray(dentelleDuCygneRGB))/255.0;
dentelleDuCygne = dentelleDuCygne(600:800,700:1000);

figure(1)
subplot(121)
imshow(dentelleDuCygne)
subplot(122)
hist(dentelleDuCygne(:),20)

%return

thresholdStars = input("Pick a threshold\n")


dentelleDuCygneBin = dentelleDuCygne>thresholdStars;


B = logical([0 1 0;
     1 1 1;
     0 1 0]);
N = 25;
B = zeros(2*N+1);
B(N:N+2,N:N+2) = logical([0 1 0; 1 1 1; 0 1 0]);


X = dentelleDuCygneBin;
y = sum(X(:));
Bn = B;
for n=1:N
	X = myOpen(dentelleDuCygneBin,Bn);
	Bn = myDilate(Bn,B);
	y = [y sum(X(:))];
end



figure(2)
subplot(121)
imshow(dentelleDuCygneBin)
subplot(122)
plot(1:(N+1),cumsum(y),'r','linewidth',4)
hold on
plot(1:(N+1),y,'g','linewidth',4)
hold off
