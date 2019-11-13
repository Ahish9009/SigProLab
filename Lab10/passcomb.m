function y = passcomb() 

	t = 0:100;
	lowf = sin(0.03.*pi.*t);
	highf = sin(0.8.*pi.*t);

	combined = lowf + highf;

	[hl, hf] = filter1(1000);
		
	reshigh = conv(hf, combined);
	reslow = conv(hl, combined);


	subplot(2,2,1);
	plot(combined);
	subplot(2,2,2);
	plot(reslow);	
	subplot(2,2,3);
	plot(combined);
	subplot(2,2,4);
	plot(reshigh);	
