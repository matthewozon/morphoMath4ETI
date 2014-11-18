function Xo = imClose(X,b)
	Xdilate = minkowskiSum(X,transposeMorpho(b));
	Xo = minkowskiSub(Xdilate,transposeMorpho(b));
endfunction
