function X=directdft(x)
	
	n = size(x,2);
	X = zeros(n);
	F = zeros(n, n);

	for l=1:n
		for m=1:n
			F(l,m) = exp(-i.*2.*pi.*(l-1).*(m-1)./n);
		end
	end

	x = transpose(x);
	X = F*x

end


