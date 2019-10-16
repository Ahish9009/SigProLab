function [conv_circ, conv_lin] = dftconv(h,x,N); 
	lx = length(x);
	lh = length(h);
	if N<max([lx lh])
		error('N must be at least the length of the longer signal.')
       	end
	
	h_circ = [h, zeros(1,N-lh)];
	x_circ = [x, zeros(1,N-lx)];
	% Compute order-N circular convolution based on length-N FFTs 
	conv_circ = ifft(fft(h_circ).*fft(x_circ))
	% Compute linear convolution based on appropriate-length FFTs/zero padding
	h_lin = [h, zeros(1,lx-1)];
	x_lin = [x, zeros(1, lh-1)];
	conv_lin = ifft(fft(h_lin).*fft(x_lin))

	convAns = conv(x, h);
	cconvAns = cconv(x, h, N);

	subplot(2,2,1);
	plot(conv_circ);
	title("Circular Convolution");

	subplot(2,2,2);
	plot(cconvAns);
	title("Circular Convolution using In-Built Functions");

	subplot(2,2,3);
	plot(conv_lin);
	title("Linear Convolution");

	subplot(2,2,4);
	plot(convAns);
	title("Linear Convolution using In-Built Functions");

	% Complexity of fft and ifft functions is NlogN, but element wise multiplication of the two fft matrics(of order N) will be O(N)
	% Thus, overall complexity is O(NlogN)

	% Complexity of convolution in time domain is O(N^2)


end

