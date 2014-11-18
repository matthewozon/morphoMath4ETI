function Xo = imOpen(X,b)
	Xerode = minkowskiSub(X,transposeMorpho(b));
	Xo = minkowskiSum(Xerode,transposeMorpho(b));
endfunction
