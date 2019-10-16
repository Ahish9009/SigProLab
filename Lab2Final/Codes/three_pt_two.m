function x = three_pt_two()
	% keeping time interval and T1 fixed
	t = -4:0.01:4;
	T1 = 0.25;

	% varying T with steps of 0.5
	for T = 1:0.5:20
        	N = round(2 * T / T1);    
		% using previous lab's squareFS function with a change in return params        	
		[sq, A] = squareFS(T, T1, t, N);
        	
		% SubPlot-1: Rectangular Pulse
		subplot(2,1,1);
        	plot(t, sq);
        	title("Rectangular Pulse");

		% SubPlot-2: Fourier Series Coefficients		
		subplot(2,1,2); 
        	stem(-N:N, A);
        	title("FS Coefficents ( T = "+T+" )");       	

        pause(0.5);
    end
end
