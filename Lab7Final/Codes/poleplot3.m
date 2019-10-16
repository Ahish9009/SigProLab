function y=poleplot()

	p=0.9;
	b = [1 -5 6];
	a = [1 -2.5 1];

	subplot(2,2,[1,2]);
	zplane(b,a);
	title("Pole-Zero Plot")
	subplot(2,2,[3,4])
	impz(b,a);
	title("Impulse Response");
	xlabel("Time")
	ylabel("h(t)")


end
