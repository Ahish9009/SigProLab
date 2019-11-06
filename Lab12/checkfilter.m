function y = checkfilter()

	w0 = 0.2.*pi;

	t = 0:1:30;
	s1 = sin(w0*t)
	s2 = sin((2*w0).*t)

	combined = s1 + s2;
	plot(abs(fft(combined)));

	[b, a] = notch(2*w0, 0.99)

	y = filter(b,a,combined);
	%plot(abs(fft(combined)));
	%plot(abs(fft(y)));
	%subplot(121);
	%plot(t, combined);
	%subplot(122);
	%plot(t, y);
end
