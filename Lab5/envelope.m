function [time_vec, env] = envelope(fs, a, d, s, dur, r)

	ampmax = 1;

	t = 0:1/fs:a;
	e = linspace(0,ampmax,a.*fs + 1);

	tdelay = a:1/fs:a+d;
	tdelay = tdelay(2:end);
	t = [t, tdelay];
	temp = linspace(ampmax, s, d.*fs+1);
	temp = temp(2:end);
	e = [e, temp];
	
	tsustain = a+d:1/fs:a+d+dur;
	tsustain = tsustain(2:end);
	t = [t, tsustain];
	temp = linspace(s, s, dur.*fs+1);
	temp = temp(2:end);
	e = [e, temp];
	
	trelease = a+d+dur:1/fs:a+d+dur+r;
	trelease = trelease(2:end);
	t = [t, trelease];
	temp = linspace(s, 0, r.*fs+1);
	temp = temp(2:end);
	e = [e, temp];
	

	env = e;
	time_vec = t;
	%plot(t, e);
end

