function y = lpf(len)

	wc = 0.4*pi;

	hd = zeros(1,len);
	for k = 1:len
		if (k ~= (len-1)/2)
			hd(1,k) = sin(wc.*(k - (len-1)./2))./(pi.*(k - (len-1)./2));
		else
			hd(1,k) = wc./pi;
		end
	end
	
	wd = transpose(blackman(len));
	hd = hd.*wd;
	hd = fftshift(fft(hd, 51));

	plot(abs(hd));
