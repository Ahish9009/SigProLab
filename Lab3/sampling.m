function y=sampling()

	%sets the finer time and generates the signal	
	t_fine = 0:0.001:2;
	x = 1 + sin(3.*pi.*t_fine) + cos(5.*pi.*t_fine);
	
	%sets the sampling period, and gets the samples of the function
	Ts = 0.1;
	tSampling = 0:Ts:2;
	xn=1 + sin(3.*pi.*tSampling) + cos(5.*pi.*tSampling);

	%gets the interpolated sample function using 3 different types of interpolation
	%it also calculates the mean squared error
	interpoled = interp1(tSampling, xn, t_fine, 'previous');
	msq1 = mean((interpoled - x).^2);
	interpoled2 = interp1(tSampling, xn, t_fine);
	msq2 = mean((interpoled2 - x).^2);
	interpoled3 = sincInterpol(xn, t_fine, Ts);
	msq3 = mean((interpoled3 - x).^2);

	%plots the original signal	
	subplot(2,3,[1,2,3]);	
	plot(t_fine, x);
	xlabel('Time');
	ylabel('y');
	title("Original Signal");

	%plots the sample and hold interpolated signal
	subplot(2,3,4);
	plot(t_fine, x, t_fine, interpoled, ":", "LineWidth", 2);
	xlabel('Time');
	ylabel('y');
	legend("Original Signal", "Interpolated Signal");
	title("Sample and Hold | MSQ = "+msq1);

	%plots the linearly interpolated signal
	subplot(2,3,5);
	plot(t_fine, x, t_fine, interpoled2, ":", "LineWidth", 2);
	xlabel('Time');
	ylabel('y');
	legend("Original Signal", "Interpolated Signal");
	title("Linear Interpolation | MSQ = "+msq2);

	%plots the interpolation using sinc function
	subplot(2,3,6);
	plot(t_fine, x, t_fine, interpoled3, ":", "LineWidth", 2);
	xlabel('Time');
	ylabel('y');
	legend("Original Signal", "Interpolated Signal");
	title("Sinc Interpollation | MSQ = "+msq3);
end

