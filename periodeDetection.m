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
title('Motif original')
subplot(122)
plot(y,'linewidth',4)
xlabel('n : distance les deux points')
title('fonction de correlation') % entre le motif original et son erosion par une pair de point

print('-dtex','data/tex/periode.tex')



