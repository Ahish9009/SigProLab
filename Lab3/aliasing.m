function y=aliasing()

	%gets the original function
	t_fine = 0:0.001:2;
	x = cos(5.*pi.*t_fine);

	%samples and interpolates using sinc for Ts=0.1
	Ts = 0.1;
	tSampling = 0:Ts:2;
	xn = cos(5.*pi.*tSampling);
	interpoled1 = sincInterpol(xn, t_fine, Ts);

	%samples and interpolates using sinc for Ts=0.2
	Ts = 0.2;
	tSampling = 0:Ts:2;
	xn = cos(5.*pi.*tSampling);
	interpoled2 = sincInterpol(xn, t_fine, Ts);
	
	%samples and interpolates using sinc for Ts=0.3
	Ts = 0.3;
	tSampling = 0:Ts:2;
	xn = cos(5.*pi.*tSampling);
	interpoled3 = sincInterpol(xn, t_fine, Ts);

	%plots the three graphs
	%plots for Ts=0.1
	subplot(1,3,1);
	plot(t_fine,x, t_fine, interpoled1, ":", "LineWidth", 2);	
	title("Sinc Interpolated Signal, T = 0.1s")
	legend("Original Signal", "Interpolated Signal")
	xlabel("Time");
	ylabel("y");

	%plots for Ts=0.2
	subplot(1,3,2);
	plot(t_fine,x, t_fine, interpoled2, ":", "LineWidth", 2);	
	title("Sinc Interpolated Signal, T = 0.2s")
	legend("Original Signal", "Interpolated Signal")
	xlabel("Time");
	ylabel("y");

	%plots for Ts=0.3
	subplot(1,3,3);
	plot(t_fine,x, t_fine, interpoled3, ":", "LineWidth", 2);	
	title("Sinc Interpolated Signal, T = 0.3s")
	legend("Original Signal", "Interpolated Signal")
	xlabel("Time");
	ylabel("y");

end


