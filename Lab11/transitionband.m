function [h] = transitionband(N,wc,tbvals)
    % Create vector of N equally-spaced frequencies
    %w = linspace(0, 2*pi, N)
    w = 0:2*pi/N:(2*pi - (2*pi/N));
    % Create ideal amplitude response of low-pass filter (remember,
    % it should be symmetric about w = pi)
    Ad = zeros(1,N);
    Ad(w <= wc) = 1;
    Ad(w >= 2*pi - wc) = 1;

    Ad
    % Determine which indices correspond to the samples just to the
    % left and the right of the cutoff frequency (if cutoff freq
    % falls exactly
    % on a sample, use that sample and the one to the right).
    for i = 1:N
        if(Ad(i) == 0)
            wleftind = i-1;
            break
        end
    end
    wrightind = wleftind + 1;
    % Update amplitude response with given transition band values at
    % these frequencies (remember the symmetry around pi);
    Ad(wleftind) = tbvals(1);
    Ad(wrightind) = tbvals(2);
    % Compute linear phase vector using correct slope
    m = (N-1)/2;
    phi = exp(-1i.*w.*m);
    % Compute ideal frequency samples as product of Ad and phi
    H = Ad.*phi;
    % Compute filter taps via inverse DFT
    h = ifft(H);
    % Make result real to get rid of near-zero imaginary parts
    h = real(h);
    % Compute finely-spaced frequency response of designed filter
    [H,wfine] = freqz(h,1,1024);
    figure;
    subplot(211);
    plot(wfine, abs(H));
    title("Magnitude Response");
    subplot(212);
    plot(wfine, angle(H));
    title("Phase Response");
end