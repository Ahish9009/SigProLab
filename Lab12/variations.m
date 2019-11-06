function y = variations() 

	for i = 0.8:0.03:0.99

		r = i;
		[b, a] = notch(0.4*pi, r);
		pause(1);
	end
end

