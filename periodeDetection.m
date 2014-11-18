clc
clear all
close all


%dilatation liee a la carte de distance
rayure = imread('rayure.jpg');

rayure = rgb2gray(rayure)/255.0;
rayure = rayure>mean(rayure(:));
rayure = rayure(1:4:end,1:4:end);

y = [];
for n=0:size(rayure,2)
	y = [y covarianceMorpho(rayure,n)];
end

figure(1)
subplot(121)
imshow(double(rayure))
subplot(122)
plot(y,'linewidth',4)



