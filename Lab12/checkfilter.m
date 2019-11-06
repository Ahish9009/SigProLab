function y = checkfilter()
	
	%setting w0
	w0 = 0.33.*pi;

	%generates signal	
	t = 0:1:300;
	s1 = sin(w0*t)
	s2 = sin((2*w0).*t)

	combined = s1 + s2;
	%combined = combined./max(combined);
	%plot(abs(fft(combined)));

	[b, a] = notch(w0, 0.95);

	filtered = filter(b,a,combined);
	subplot(221);
	plot(abs(fftshift(fft(combined))));
	subplot(222);
	plot(abs(fftshift(fft(filtered))));
	subplot(223);
	plot(t, combined);
	subplot(224);
	plot(t, filtered);
end
