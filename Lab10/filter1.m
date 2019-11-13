function [hn_low, hn_high] = filter(len)
    wc = 0.4*pi;
    hd = zeros(1, len);
    for i = 1:len
        if(i == (len-1)./2)
            hd(i) = wc./pi;
        else
            hd(i) = sin(wc.*(i - (len-1)./2))./(pi*(i - (len-1)./2));
        end
    end
    w = blackman(len);
    hn_low = hd.*transpose(w);
    hl = fftshift(fft(hn_low, 51));
    subplot(121);
    plot(abs(hl));
    
    for i = 1:len
        hd(i) = hd(i) .* (-1).^i;
    end
    w = blackman(len);
    hn_high = hd.*transpose(w);
    hf = fftshift(fft(hn_high, 51));
    subplot(122);
    plot(abs(hf));
end
