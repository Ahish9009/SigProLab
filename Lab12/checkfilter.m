function y = checkfilter()
	
	%setting w0
	w0 = 0.33.*pi;

	%generates signal	
	t = 0:1:300;
	s1 = sin(w0*t);
	s2 = sin((2*w0).*t);

	combined = s1 + s2;
	%combined = combined./max(combined);

	%gets the b and a matrix from notch function
	[b, a] = notch(w0, 0.95);

	%filters the signal using the values found from the notch function
	filtered = filter(b,a,combined);

	%plotting
	subplot(221);
	plot(abs(fftshift(fft(combined))));
	title("Combined Signal FFT")
	xlabel("w");
	ylabel("Magnitude")

	subplot(222);
	plot(abs(fftshift(fft(filtered))));
	title("Filtered Signal FFT")
	xlabel("w");
	ylabel("Magnitude")

	subplot(223);
	plot(t, combined);
	title("Combined Signal in Time Domain")
	xlabel("t");
	ylabel("x(t)");

	subplot(224);
	plot(t, filtered);
	title("Filtered Signal in Time Domain")
	xlabel("t");
	ylabel("x(t)");
end
