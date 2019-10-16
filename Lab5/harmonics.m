function y=harmonics(time_vec, harmamps, F0, fs)

	%time_vec = 0:0.01:500;
	%harmamps = randi([0,500], 1,50);
	harmphase = zeros(size(harmamps));
	%F0 = 100;

	y = zeros(size(time_vec));

	for i=1:length(harmamps)

		y = y + harmamps(i).*sin(2.*pi.*i.*F0.*time_vec + harmphase(i));

	end

	y = y/max(y(:))*0.95;
	%plot(time_vec, y);
	%sound(y,fs);
end

