function X = dtft()

	t = -10:10; 
	%x = zeros(100);
	%for i=5:50
		%x(i) = 1;
	%end
	%x(50)=1;
	%x = 0.5.^t;
	x = cos(t);;
	N0 = 0;
	w = -3.*pi:0.01:3.*pi;
	
	X = zeros(size(w));

	for i=1:length(w)
		X(i)=0;
		for n = 1:length(x) 
			X(i) = X(i) + x(n).*exp(-1i.*w(i).*(n-N0));
			
		end
	end
% Plot the DTFT magnitude and phase
figure;
subplot(211); plot(w, abs(X));
subplot(212); plot(w, angle(X));
% Plot the DTFT real and imaginary components figure;
figure;
subplot(211); plot(w, real(X));
subplot(212); plot(w, imag(X));
end	


