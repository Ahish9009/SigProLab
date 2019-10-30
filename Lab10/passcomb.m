function y = passcomb() 

	t = 0:0.01:8*pi;
	lowf = sin(0.2.*pi.*t);
	highf = sin(0.6.*pi.*t);

	combined = lowf + highf;

	wHamming = hamming(51);
	resHamming = conv(combined, wHamming);
	wHanning = hann(51);
	resHamming = conv(combined, wHanning);

	subplot(5,3,1);
	plot(combined);
	subplot(5,3,2);
	plot(wHamming);
	subplot(5,3,3);
	plot(resHanning);

	subplot(5,3,1);
	plot(combined);
	subplot(5,3,2);
	plot(wHanning);
	subplot(5,3,3);
	plot(resHanning);
