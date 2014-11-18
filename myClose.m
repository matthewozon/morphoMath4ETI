function Xb = myClose(X,b)
bt = transposeMorpho(b);
Xb = myDilate(X,b);
Xb = myErode(Xb,bt);
endfunction
