function y = overlapadd(h,x,N)

	% If N is not already a power of 2, replace it with the next power of 2
	N = 2^(nextpow2(N));

	% Compute important lengths
	M = size(h,2);
	L = N-M+1;
	Lx = size(x,2);

	% Length-N DFT of filter
	H = fft(h, N);

	% Initialize y (include some extra zeros at end)
	y = zeros(1,Lx+N);

	% Pad x with zeros to be a multiple of L
	if rem(Lx,L) ~= 0
		x = [x,zeros(1,L-rem(Lx,L))];
	end

	% How many blocks will we have?
	K = size(x,2)/L;

	% Loop over blocks
	for i=1:K

		% Extract length-L block from x
		block = [x(L.*(i-1)+1: L.*(i-1)+L), zeros(1,M-1)];

		% Take length-N FFT of this block
		B = fft(block);

		% Compute product in frequency domain and take inverse DFT
		yblock = ifft(B.*H);

		% If first block, initialize y
		if i==1
			y(1:N) = yblock;
		else  % Add the result to the appropriate location in y
			y(L*(i-1)+1: L*(i-1) + N) = y(L*(i-1)+1: L*(i-1) + N) + yblock;
		end

	end

	%output of the inbuilt function
	y2 = conv(h,x);

	% Trim extra zeros from the end of y to get the correct length convolution
	y2 = y2(1:Lx+M-1);
	y = y(1:Lx+M-1);

	%calculates error
	e = sum(abs(y2-y));

	%plotting the 2 convolutions
	subplot(3,1,1);
	stem(y);
	title("DFT using Overlap Add");
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
	legend("Overlap Add", "Inbuilt Function")
	title("Plotted together (Error: "+e+")");
	xlabel("n");
	ylabel("x(n)*h(n)")

end
