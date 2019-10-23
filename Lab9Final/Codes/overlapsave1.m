function y = overlapsave1(h,x,N)

	%convolution using inbuilt function
	y2 = conv(h,x);

	% If N is not already a power of 2, replace it with the next power of 2
	N = 2^(nextpow2(N));

	% Compute important lengths
	M = length(h);
	L = N-M+1;
	Lx = length(x);

	% Append M-1 0's to x
	x = [zeros(1, M-1) x];

	% Length-N DFT of filter
	H = fft(h,N);

	% Initialize y
	y = [];

	% Until we have no more blocks
	while ~isempty(x)
		% Extract length-N block from the front of x (or all of x if length is less than N)
		if length(x)>N
			block = x(1:N);
		else
			block = x;
		end

		% Take length-N FFT of this block
		B = fft(block, N);

		% Compute product in frequency domain and take inverse DFT
		yblock = ifft(B.*H)

		% Append the non-aliased part of y to the result
		y = [y, yblock(M:N)]

		% Remove L data points from the front of x
		x = x(L+1:end);
	end

	% Trim extra zeros from the end of y to get the correct length convolution
	y = y(1:Lx+M-1);

	%calculates the error
	e = sum(abs(y2-y));

	%plotting the 2 convolutions
	subplot(3,1,1);
	stem(y);
	title("DFT using Overlap Save");
	xlabel("n");
	ylabel("x(n)*h(n)")

	subplot(3,1,2);
	stem(y2);
	title("DFT using InBuilt Function");
	xlabel("n");
	ylabel("x(n)*h(n)")

	subplot(3,1,3);
	hold on
	stem(y)
	stem(y2)
	hold off
	legend("Overlap Save", "Inbuilt Function")
	title("Plotted together (Error: "+e+")");
	xlabel("n");
	ylabel("x(n)*h(n)")


end
