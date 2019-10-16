function y = ltiResponse2()

%     sets the time period and time vector
    T = 6;
    t = -5:0.001:5;
    
%     generates rectangular pulse 
    x = rectangularPulse(-2,2,t);
    
%     sets number of coefficients to use and finds their values
    N = 1000;
    A = findFourierCoefficients(T, x, t, N);
    
%     gets output of the 3 filters in frequency domain
    newAHigh = hHighPass(A, N);
    newALow = hLowPass(A, N);
    newAc = hPartC(A, N);

%     Plots low pass filter output
    subplot(2,3,1);
    plot(t, partialfouriersum(newALow, T, t));
    title("Low Pass Filter");
    
%     Plots high pass filter output
    subplot(2,3,2);
    plot(t, partialfouriersum(newAHigh, T, t));
    title("High Pass Filter");

%     Plots output for transfer function in part c
    subplot(2,3,3);
    plot(t, partialfouriersum(newAc, T, t));
    title("Part (c)");
    
%     Plots the original signal
    subplot(2,3,[4,5,6]);
    plot(t, x);
    title("Original Signal");
    
end
    
    