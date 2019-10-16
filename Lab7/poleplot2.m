function y=poleplot()

	r = 0.95;
	theta = pi/2;

	b = [0 1];
	a = [1 -(2*r)*cos(theta) r*r];

	for theta = 0:0.2:pi

	%bnew = [0 1];
	%anew = [1 -(2*r)*cos(theta) r*r];
	subplot(3,4,[1,2,3,4])
	zplane(b,a)
	title("Pole-Zero Plot: theta:pi/2, r:0.95")

	[H w] = freqz(b, a, -3*pi:1/100:3*pi);
	subplot(4,4,[5,6]);
	plot(w, 20.*log(abs(H)), 'b');
	title("Magnitude: theta:pi/2, r:0.95");
	xlabel("Frequency")
	ylabel("Magnitude(dB)")
	subplot(4,4,[7,8]);
	plot(w, angle(H), 'r');
	title("Phase");
	xlabel("Frequency")
	ylabel("Phase")

	bnew = [0 1];
	anew = [1 -(2*r)*cos(theta) r*r];
	[H w] = freqz(b,anew, -3*pi:0.01:3*pi);

	subplot(4,4,[9,10]);
	plot(w, 20.*log(abs(H)), 'b');
	title("Magnitude: theta = "+theta);
	subplot(4,4,[11,12]);
	xlabel("Frequency")
	ylabel("Magnitude(dB)")
	plot(w, angle(H), 'r');
	title("Phase: theta = "+theta);
	xlabel("Frequency")
	ylabel("Phase")

	subplot(4,4,[13,16]);
	[h t] = impz(b,a);
	stem(t, h);
	title("Impulse Response: theta:0.95,r:0.95")
	xlabel("Time")
	ylabel("h(t)")

	pause(1);
	end
end
