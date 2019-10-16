function y = ltiResponse3()

%     sets the time period and time vector
    T = 2*pi;
    t = -3*T:0.001:3*T;

%     sets number of coefficients to use
    N = 15;
    
%     sets/finds the coefficients and generates the function in time domain
    A = ones(N);
    x = partialfouriersum(A, T, t);
    
%     gets the output in frequency domain for high & low pass filters, and (1/1+jw) filter
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
    
    