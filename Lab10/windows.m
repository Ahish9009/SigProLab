function y = windows()
    N = 51;
    w = ones(N); 
    subplot(251);
    plot(w);
    W = fft(w, 1001);
    subplot(256);
    plot(20.*log10(abs(fftshift(W))));
    title("Rectangular Window");
    
    w = bartlett(N);
    subplot(252);
    plot(w);
    W = fft(w, 1001);
    subplot(257);
    plot(20.*log10(abs(fftshift(W))));
    title("Barlett Window");
    
    w = hamming(N);
    subplot(253);
    plot(w);
    W = fft(w, 1001);
    subplot(258);
    plot(20.*log10(abs(fftshift(W))));
    title("Hamming Window");
    
    w = hann(N);
    subplot(254);
    plot(w);
    W = fft(w, 1001);
    subplot(259);
    plot(20.*log10(abs(fftshift(W))));
    title("Hanning Window");
    
    w = blackman(N);
    subplot(255);
    plot(w);
    W = fft(w, 1001);
    subplot(2,5,10);
    plot(20.*log10(abs(fftshift(W))));
    title("Blackman Window");
    
end