function Xb = minkowskiSum(X,b)
	L = size(X,1);
	C = size(X,2);
	lb = size(b,1);
	cb = size(b,2);
	Xb = zeros(L+lb,C+cb);

	dlPlus = 0;
	dlMoins = 0;
	if mod(lb,2)~=0 
		dlPlus = floor(lb/2);%2n+1
	else 
		dlPlus = floor(lb/2)+1;
	endif
	if mod(lb,2)~=0 
		dlMoins = floor(lb/2);%2n+1
	else 
		dlMoins = floor(lb/2);
	endif


	dcPlus = 0;
	dcMoins = 0;
	if mod(cb,2)~=0 
		dcPlus = floor(cb/2);%2n+1
	else 
		dcPlus = floor(cb/2)+1;
	endif
	if mod(cb,2)~=0 
		dcMoins = floor(cb/2);%2n+1
	else 
		dcMoins = floor(cb/2);
	endif

	[dc, dl] = meshgrid(-dlMoins:dlPlus,-dcMoins:dcPlus);

	Xb((dlMoins+1):(L+dlMoins),(dcMoins+1):(C+dcMoins)) = X;
	Xtmp = Xb;

	for l=(dlMoins+1):(L+lb-dlPlus)
		for c=(dcMoins+1):(C+cb-dcPlus)
			%if(Xb(l,c))
			%	Xtmp((l-dlMoins):(l+dlPlus),(c-dcMoins):(c+dcPlus)) = or(Xb((l-dlMoins):(l+dlPlus),(c-dcMoins):(c+dcPlus)),b);
			%endif
			if(Xb(l,c)==1)
				for i=1:lb
					for j=1:cb
						if(b(i,j)==1)
							Xtmp(l+dl(i,j),c+dc(i,j)) = 1;
							%Xb(l+i-1,c+j-1) = 1;%X(l,c)+b(i,j);
						endif
					endfor
				endfor
			endif
		endfor
	endfor
	Xb = Xtmp((dlMoins+1):(L+dlMoins),(dcMoins+1):(C+dcMoins));
endfunction
