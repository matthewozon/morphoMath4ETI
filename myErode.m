function Xb = myErode(X,b)
bt = transposeMorpho(b);
Xb = minkowskiSub(X,bt);
endfunction
