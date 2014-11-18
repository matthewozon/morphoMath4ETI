function y = covarianceMorpho(X,n)
	b = [1 zeros(1,n) 1];
	Eb = myErode(X,b);
	%imshow(double(Eb))
	y = sum(double(Eb(:)))/sum(double(X(:)));
endfunction
