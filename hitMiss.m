function Xb = hitMiss(X,Bfg,Bbg)
Xb = myErode(X, Bfg) & myErode(!X, Bbg);
%Xb = imerode(X, Bfg) & imerode(!X, Bbg);
endfunction
