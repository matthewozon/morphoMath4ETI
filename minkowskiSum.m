function Xb = minkowskiSum(X,b)


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
					Xb = or(Xb,tmp);
					tmp(:) = 0;
				endif
			endif
		endfor
	endfor
	Xb = Xb((floor(lb/2)+1):(L+floor(lb/2)),(floor(cb/2)+1):(C+floor(cb/2)));

	%L = size(X,1);
	%C = size(X,2);
	%lb = size(b,1);
	%cb = size(b,2);
	%Xb = zeros(L+lb,C+cb);


	%dlPlus = lb-floor((size(b,1)+1)/2);
	%dlMoins = floor((size(b,1)+1)/2)-1;
	%dcPlus = cb-floor((size(b,2)+1)/2);
	%dcMoins = floor((size(b,2)+1)/2)-1;


	%[dc, dl] = meshgrid(-dlMoins:dlPlus,-dcMoins:dcPlus);

	%Xb((dlMoins+1):(L+dlMoins),(dcMoins+1):(C+dcMoins)) = X;
	%Xtmp = Xb;

	%for l=(dlMoins+1):(L+lb-dlPlus)
	%	for c=(dcMoins+1):(C+cb-dcPlus)
	%		if(Xb(l,c)==1)
	%			for i=1:lb
	%				for j=1:cb
	%					if(b(i,j)==1)
	%						Xtmp(l+dl(i,j),c+dc(i,j)) = 1;
	%					endif
	%				endfor
	%			endfor
	%		endif
	%	endfor
	%endfor
	%Xb = Xtmp((dlMoins+1):(L+dlMoins),(dcMoins+1):(C+dcMoins));
endfunction
