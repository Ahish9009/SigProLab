%Function to calculate discrete time fourier transform
function X = dtft(x, N0, w)
    X = zeros(size(w));
    % Evaluate the DTFT sum directly for each of the w sample
    for i=1:size(w,2)
        for n=1:size(x,2)
            X(i) = X(i) + x(n).*exp(-1i.*w(i).*(n-N0));
        end
    end
    
    % Plot the DTFT magnitude and phase
    figure;
    subplot(211); plot(w, abs(X));
    xlabel("w");
    ylabel("Magnitude");
    title("Magnitude of DTFT");
    subplot(212); plot(w, angle(X));
    xlabel("w");
    ylabel("Phase");
    title("Phase of DTFT");
    
    % Plot the DTFT real and imaginary components
    figure;
    subplot(211); plot(w, real(X));
    xlabel("w");
    ylabel("Value");
    title("Real component of DTFT");
    subplot(212); plot(w, imag(X));
    xlabel("w");
    ylabel("Value");
    title("Imaginary component of DTFT");
end