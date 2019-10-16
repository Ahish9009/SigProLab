% Function to plot frequency response of given systems
function h = dtscde()
    w = -3*pi : 0.01 : 3*pi;   
    
    % Problem 3.C
    % Obtained frequency response (from analysis) for:
    % ?[?] = ?[?] + 0.9 ?[? ? 1]
    h = 1./(1 + 0.9.*exp(-1i.*w));
    
    % Plotting magnitude and phase frequency response
    figure;
    subplot(211); plot(w, abs(h));
    xlabel("w");
    ylabel("Magnitude");
    title("Magnitude of Frequency Response for y[n]=x[n]+0.9y[n-1]");
    subplot(212); plot(w, angle(h));
    xlabel("w");
    ylabel("Phase");
    title("Phase of Frequency Response for y[n]=x[n]+0.9y[n-1]");

    % Problem 3.D
    % Obtained frequency response (from analysis) for:
    % ?[?] = ?[?] - 0.9 ?[? ? 1]
    h = 1./(1 - 0.9.*exp(-1i.*w));
    
    % Plotting magnitude and phase frequency response
    figure;
    subplot(211); plot(w, abs(h));
    xlabel("w");
    ylabel("Magnitude");
    title("Magnitude of Frequency Response for y[n]=x[n]-0.9y[n-1]");
    subplot(212); plot(w, angle(h));
    xlabel("w");
    ylabel("Phase");
    title("Phase of Frequency Response for y[n]=x[n]-0.9y[n-1]");
end
