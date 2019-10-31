function [w,h] = type1_dft(N,wc)
	% Create vector of equally-spaced frequencies
	%w = linspace(0, 2*pi, N)
	w = 0:2*pi/N: (2*pi - (2*pi/N));
	% Create ideal amplitude response of low-pass filter (remember,
	%it should be symmetric about w = pi)
	
	Ad = zeros(1,N);
	Ad(w <= wc ) = 1;
	Ad(w >= 2*pi-wc) = 1;
	% Compute linear phase vector using correct slope
	M = (N-1)/2;
	phi = exp(-1i*w*M);
	% Compute ideal frequency samples as product of Ad and phi
	H = Ad.*phi;
       %plot(abs(H));	
	% Compute filter taps via inverse DFT
	h = ifft(H);
	H1 = fft(h, 1024);
	

	% Make result real to get rid of near-zero imaginary parts
	h = real(h);
	% Plot impulse response, magnitude response, and phase response
	%over a finer frequency grid
	
	subplot(3,1,1);
	plot(w, h);
	title("Impulse Response");
	xlabel("t");
	ylabel("h(t)");

	subplot(3,1,2);
	hold on;
	plot(0:2*pi/1023:2*pi,abs(H1));
	stem(w,abs(H));
	title("Magnitude Response");
	legend("DTFT", "Calculated Magnitude Response")
	
	subplot(3,1,3);
	plot(angle(H1));

	%(c) It comes closer to the original shape	

end
