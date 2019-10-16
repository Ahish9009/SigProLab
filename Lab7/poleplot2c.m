function y=poleplot()

	r = 0.95;
	theta = pi/3;

	b = [0 1];
	a = [1 -(2*r)*cos(theta) r*r];

	for r = 0:0.1:1

		%bnew = [0 1];
		%anew = [1 -(2*r)*cos(theta) r*r];
		subplot(3,4,[1,2,3,4])
		zplane(b,a)
		title("Pole-Zero Plot: theta:pi/3, r:0.95")

		[H w] = freqz(b, a, -3*pi:1/1000:3*pi);
		subplot(4,4,[5,6]);
		plot(w, 20.*log(abs(H)), 'b');
		title("Magnitude: theta:pi/3, r:0.95");
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
		title("Magnitude: r = "+r);
		xlabel("Frequency")
		ylabel("Magnitude(dB)")
		subplot(4,4,[11,12]);
		plot(w, angle(H), 'r');
		title("Phase: r = "+r);
		xlabel("Frequency")
		ylabel("Phase")

		subplot(4,4,[13,16]);
		[h t] = impz(b,a);
		stem(t, h);
		title("Impulse Response: theta:pi/3, r:0.95")
		xlabel("Time")
		ylabel("h(t)")

		pause(1);
	end
end
