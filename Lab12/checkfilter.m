function y = checkfilter()

	w0 = 0.4.*pi;

	t = 0:1:5000;
	s1 = sin(w0*t)
	s2 = sin((2*w0).*t)

	combined = s1 + s2;
	combined = combined./max(combined);
	%plot(abs(fft(combined)));

	[b, a] = notch(2*w0, 0.99)

	%freqz(b,a);

	filtered = filter(a,b,combined);
	subplot(221);
	plot(abs(fft(combined)));
	subplot(222);
	plot(abs(fft(filtered)));
	subplot(223);
	plot(t, combined);
	subplot(224);
	plot(t, filtered);
end
