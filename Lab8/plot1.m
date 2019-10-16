function y=plot1(n, l)

	x = [ones(1, l),zeros(1, n-l)];

	X = directdft(x);
	
	subplot(1,2,1);
	plot(x, real(X));

	subplot(1,2,2);
	plot(x, imag(X));

end
