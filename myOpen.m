function Xb = myOpen(X,b)
bt = transposeMorpho(b);
Xb = myErode(X,b);
Xb = myDilate(Xb,bt);
endfunction
