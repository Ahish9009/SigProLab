function y = checkfilter()

	w0 = 0.4.*pi;

	t = 0:1:500;
	s1 = sin(w0*t)
	s2 = sin((2*w0).*t)

	combined = s1 + s2;
	combined = combined./max(combined);
	%plot(abs(fft(combined)));

	%[b, a] = notch(2*w0, 0.99)

	b = [1 2 1];
	a = [1 -1.481784128538675693320669779495801776648 0.831585910854089060961769064306281507015];
	%freqz(b,a);

	filtered = filter(b,a,combined);
	subplot(221);
	plot(abs(fft(combined)));
	subplot(222);
	plot(abs(fft(filtered)));
	subplot(223);
	plot(t, combined);
	subplot(224);
	plot(t, filtered);
end