clc
clear all
close all

%load the binary image
imBin = imread('accessoire_poker_heart_edges.tif');
%imBin = bwmorph(imBin,'skel');
class(imBin(1))

%load pattern to be detected
imPat = imread('heart_pattern.tif');
class(imPat(1))
imPat = imrotate(double(imPat),0);%-45-180
impat = double(imPat==1) + 0*double(imPat==0) + 0*double(imPat~=imPat);
imPat = imPat==1;

%show
figure(1)
subplot(121)
imshow(imBin)
subplot(122)
imshow(imPat)

%voting method

[L,C] = size(imBin);
[Lpat,Cpat] = size(imPat);

pollResult = zeros(L,C);

imPatTranspose = transposeMorpho(imPat);


for l=(1+floor(Lpat/2)):(L-floor(Lpat/2))
	for c=(1+floor(Cpat/2)):(C-floor(Cpat/2))
		if(imBin(l,c)==1)
			pollResult((l-floor(Lpat/2)):(l-floor(Lpat/2)+Lpat-1),(c-floor(Cpat/2)):(c-floor(Cpat/2)+Cpat-1)) = pollResult((l-floor(Lpat/2)):(l-floor(Lpat/2)+Lpat-1),(c-floor(Cpat/2)):(c-floor(Cpat/2)+Cpat-1)) + imPatTranspose;
		endif
	endfor
endfor

figure(3)
subplot(121)
hist(pollResult(:),20)
subplot(122)
imshow(pollResult/max(pollResult(:)))
cstr = input('Choose threshold regarding the histogram in figure 3: ')
%cstr = inputdlg ('Choose threshold regarding the histogram in figure 3', 'Threshold')


%show results
rgbPollResult = zeros(L,C,3);
rgbPollResult(:,:,1) = imBin + double(pollResult>cstr);
rgbPollResult(:,:,2) = imBin;
rgbPollResult(:,:,3) = imBin;



figure(2)
imshow(rgbPollResult)
%imshow(double(pollResult>40)+double(imBin))
