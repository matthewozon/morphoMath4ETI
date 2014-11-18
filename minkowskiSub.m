function Xb = minkowskiSub(X,b)
	L = size(X,1);
	C = size(X,2);
	lb = size(b,1);
	cb = size(b,2);
	Xb = logical(zeros(L+lb,C+cb));
	tmp = logical(zeros(L+lb,C+cb));
	condFirst = true;
	for i=1:lb
		for j=1:cb
			if(b(i,j)==1)
				if(condFirst)
					Xb(i:i+L-1,j:j+C-1) = X;
					condFirst = false;
				else
					tmp(i:i+L-1,j:j+C-1) = X;
					Xb = and(Xb,tmp);
					tmp(:) = 0;
				endif
			endif
		endfor
	endfor
	Xb = Xb((floor(lb/2)+1):(L+floor(lb/2)),(floor(cb/2)+1):(C+floor(cb/2)));
endfunction
