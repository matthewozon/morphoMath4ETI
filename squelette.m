function S = squelette(X,b)
	%init
	bn = b;
	condition = true;
	S = false(size(X));
	En = X;
	while condition
		%calculate Sn
		En = myErode(En,b);
		EnOpen = myOpen(En,b);
		Sn = and(En,not(EnOpen));
		%update bn
		bn = minkowskiSum(bn,b);
		%update squelette
		if(S==or(S,Sn)) %check idempotence
			condition=false;
		else 	
			S = or(S,Sn);
		endif
	endwhile
endfunction
