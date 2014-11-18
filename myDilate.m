function Xb = myDilate(X,b)
bt = transposeMorpho(b);
Xb = minkowskiSum(X,bt);
endfunction
