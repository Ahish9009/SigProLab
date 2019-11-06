function y = passcomb() 

	%generating the combined signal
	t = 0:1000;
	lowf = sin(0.03.*pi.*t);
	highf = sin(0.8.*pi.*t);

	%combining the signal
	combined = lowf + highf;

	%generating the transition band
	h = transitionband(21, 0.4*pi, [0.7 0.7]);

	res = conv(h, combined);

	%Plotting
	figure;

	subplot(2,1,1);
	plot(combined);
	title("Combined Signal");
	xlabel("t");
	ylabel("x(t)");

	subplot(2,1,2);
	plot(res);
	title("On passing through filter");
	xlabel("t");
	ylabel("x(t)");
end
