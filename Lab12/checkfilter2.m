% function to use the exported filter from filterDesigner
function checkfilter2()
	w0 = 0.4.*pi;

    % generating the combined signal
	t = 0:1/100:5000;
	s1 = sin(w0*t);
	s2 = sin((2*w0).*t);
	combined = s1 + s2;
    
    % filter coefficients from filterDesigner
    b = [1 2 1];
    a = [1 -1.481784128538675693320669779495801776648 0.831585910854089060961769064306281507015];
	%filtered = filter(b, a, combined);
	filtered = doFilter(combined);
	
    % plotting values
    subplot(221);
	plot(abs(fftshift(fft(combined))));
	title("Combined Signal FFT")
	xlabel("w");
	ylabel("Magnitude")

	subplot(222);
	plot(abs(fftshift(fft(filtered))));
	title("Filtered Signal FFT")
	xlabel("w");
	ylabel("Magnitude")

	subplot(223);
	plot(t, combined);
	title("Combined Signal in Time Domain")
	xlabel("t");
	ylabel("x(t)");

	subplot(224);
	plot(t, filtered);
	title("Filtered Signal in Time Domain")
	xlabel("t");
	ylabel("x(t)");
end
