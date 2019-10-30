function y = passcomb() 

	t = 0:0.01:4*pi;
	lowf = sin(0.02.*pi.*t);
	highf = sin(6.*pi.*t);

	combined = lowf + highf;

	wHamming = hamming(51);
	resHamming = conv(combined, wHamming);
	wHanning = hann(51);
	resHanning = conv(combined, wHanning);
	wBartlett = bartlett(51);
	resBartlett = conv(combined, wBartlett);
	wRect = rectwin(51);
	resRect = conv(combined, wRect);
	wBlackman = blackman(51);
	resBlackman = conv(combined, wBlackman);


	subplot(5,3,1);
	plot(combined);
	title("Original signal")
	xlabel("t")
	ylabel("x(t)")
	subplot(5,3,2);
	plot(wHamming);
	subplot(5,3,3);
	plot(resHanning);

	subplot(5,3,4);
	plot(combined);
	title("Original signal")
	xlabel("t")
	ylabel("x(t)")
	subplot(5,3,5);
	plot(wHanning);
	subplot(5,3,6);
	plot(resHanning);

	subplot(5,3,7);
	plot(combined);
	title("Original signal")
	xlabel("t")
	ylabel("x(t)")
	subplot(5,3,8);
	plot(wBartlett);
	subplot(5,3,9);
	plot(resBartlett);

	subplot(5,3,10);
	plot(combined);
	title("Original signal")
	xlabel("t")
	ylabel("x(t)")
	subplot(5,3,11);
	plot(wRect);
	subplot(5,3,12);
	plot(resRect);

	subplot(5,3,13);
	plot(combined);
	title("Original signal")
	xlabel("t")
	ylabel("x(t)")
	subplot(5,3,14);
	plot(wBlackman);
	subplot(5,3,15);
	plot(resBlackman);
