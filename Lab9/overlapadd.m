function y = overlapadd(h,x,N)

	% If N is not already a power of 2, replace it with the next power of 2
	N = 2^(nextpow2(N))

	% Compute important lengths
	M = size(h,2)
	L = N-M+1
	Lx = size(x,2)

	% Length-N DFT of filter

	H = fft(h, N);

	% Initialize y (include some extra zeros at end)
	y = zeros(1,Lx+N);

	% Pad x with zeros to be a multiple of L
	x = [x,zeros(1,L-rem(Lx,L))]

	% How many blocks will we have?
	K = size(x,2)/L

	% Loop over blocks
	for i=1:K

		% Extract length-L block from x
		block = [x(L.*(i-1)+1: L.*(i-1)+L), zeros(1,M-1)]

		% Take length-N FFT of this block
		B = fft(block)

		% Compute product in frequency domain and take inverse DFT
		yblock = ifft(B.*H)

		% If first block, initialize y
		if i==1
			y(1:N) = yblock;
		else  % Add the result to the appropriate location in y
			y(L*(i-1)+1: L*(i-1) + N) = y(L*(i-1)+1: L*(i-1) + N) + yblock;
		end

	end

	% Trim extra zeros from the end of y to get the correct length convolution

	y2 = conv(h,x);

	y2 = y2(1:Lx+M-1);
	y = y(1:Lx+M-1);
	
	e = sum(abs(y2-y))

	subplot(2,1,1);
	stem(y);
	
	subplot(2,1,2);
	stem(y2);
