function X = radix2fft(x);

	% x should be a length-N column vector i
	N = size(x,2)
	X = zeros(1,N);

	if ~isequal(unique(factor(N)),2)
		error('N is not a power of 2!'); end
	if N == 2
		% Compute length-2 DFT directly (it's super simple) X = ...
		X = fft(x);
		X = [x(1) + x(2), x(1) - x(2)];
	else
		% Split input vector into even and odd parts
		x_even = x(1:2:end)
		x_odd =x(2:2:end)
		% Take radix 2 FFT of each part
		X_even = radix2fft(x_even);
		X_odd = radix2fft(x_odd);
		% Recombine length N/2 results into length N result
		for l=1:(N/2)
			X(1,l) = X_even(l) + exp(-i.*2.*pi.*(l-1)./N).*X_odd(l);
			X(1,l+N/2) = X_even(l) - exp(-i.*2.*pi.*(l-1)./N).*X_odd(l);
		end

	end
end
