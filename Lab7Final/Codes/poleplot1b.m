function y=poleplot()

	p=0.9;
	b = [1 -3.33];
	a = [1 -0.3];

	for i=-10:10

		subplot(3,4,[1,2,3,4])
		zplane(b,a)
		title("Pole-Zero Plot: 0.9")

		[H w] = freqz(b, a, -3*pi:1/1000:3*pi);
		subplot(4,4,[5,6]);
		plot(w, 20.*log(abs(H)), 'b');
		title("Magnitude: p=0.9");
		xlabel("Frequency")
		ylabel("Magnitude")
		subplot(4,4,[7,8]);
		plot(w, angle(H), 'r');
		xlabel("Frequency")
		ylabel("Phase")
		title("Phase");

		p = i/10;
		bnew = [1 -10/i];
		anew = [1 -p];
		[H w] = freqz(bnew,anew, -3*pi:0.01:3*pi);

		subplot(4,4,[9,10]);
		plot(w, abs(H), 'b');
		title("Magnitude: p = "+p);
		subplot(4,4,[11,12]);
		xlabel("Frequency")
		ylabel("Magnitude")
		plot(w, angle(H), 'r');
		title("Phase: p = "+p);
		xlabel("Frequency")
		ylabel("Phase")

		subplot(4,4,[13,16]);
		[h t] = impz(b,a);
		stem(t, h);
		title("Impulse Response: p=0.9")
		xlabel("Time")
		ylabel("h(t)")

		pause(1);
	end
end
