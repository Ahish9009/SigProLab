function synthesizer(notes, dur, harmamps, adsr, fs)


	%mary had a lamb input - [330, 294, 262, 294, 330, 330, 330, 294, 294, 294, 330, 392, 392, 330, 294, 262, 294, 330, 330, 330, 330, 294, 294, 330, 294, 262], [1.5,1,1,1,1,1,1.5,1,1,1.5,1,1,1.5,1.5,1,1,1,1,1,1,1.5,1,1,1,1,2], randi([1,500], 1, 5), [0.2,0.2,0.5, 0.1, 0.1], 48000

	y = [];

	for i=1:size(notes,2)

		curradsr = dur(i).*adsr;
		a = curradsr(1);
		d = curradsr(2);
		s = curradsr(3);
		sdur = curradsr(4);
		r = curradsr(5);

		[t, e] = envelope(fs, a, d, s, sdur, r);

		h = harmonics(0:1/fs:(a+d+sdur+r), harmamps, notes(i), fs);

		n = e.*h;

		y = [y, n];
	end
	plot(1:length(y), y);
	sound(y, fs);
end
