function xr=sincInterpol(xn, t_fine, Ts)
	
	%defines n and sampling frequency
	%initializes reconstructed signal
	n = size(xn,2);
	xr = zeros(1,size(t_fine,2));
	ws = 2.*pi./Ts;
	wc = ws./2;

	%uses the sinc reconstruction formula to reconstruct the signal
	for i=1:size(t_fine,2)
		for k=1:n

			%if the limiting condition is not reached
			if (t_fine(i) ~= (k-1).*Ts)
				%gets the term to be added at every iteration
				toAdd =  Ts.*xn(k).* (sin(wc.*(t_fine(i) - (k-1).*Ts))./(pi.*(t_fine(i) - (k-1).*Ts)));
				xr(1,i) = xr(1,i) + toAdd;

			%if the limiting condition is reached
			else
				toAdd = Ts.*xn(k).*(wc./pi);
				xr(1,i) = xr(1,i) + toAdd;
			end
		end
	end
end

		


