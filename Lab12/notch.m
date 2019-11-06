function [b, a] = notch(w0, r) 

	% Compute numerator polynomial from w0
	b = [1 -(exp(1i*w0) + exp(-1i*w0)) 1];
	% Compute denominator polynomial from r and w0
	a = [1 -r*(exp(1i*w0) + exp(-1i*w0)) r*r];

	% Determine gain so that frequency response has magnitude 1 at w0
	b = b.*(1 - 2.*r.*cos(w0) + r.*r)./(2 - 2.*cos(w0));
	% Diagnostic display
	freqz(b,a);
	%fvtool(b,a);
end
