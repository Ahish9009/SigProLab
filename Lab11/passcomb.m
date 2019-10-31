function y = passcomb() 

	t = 0:1000;
	lowf = sin(0.03.*pi.*t);
	highf = sin(0.8.*pi.*t);

	combined = lowf + highf;

	h = transitionband(21, 0.4*pi, [0.7 0.7]);
		
	res = conv(h, combined);
	figure;
    %Plotting
	subplot(2,1,1);
	plot(combined);
    title("Combined Signal");
	subplot(2,1,2);
	plot(res);
    title("On passing through filter");
	