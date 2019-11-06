function [fib,b,a] = fibonacci_iir(n)
    % Determine IIR filter that produces Fibonacci sequence
    a = [1 -1 -1];
    b = [1 0 0];
    % Create length-n impulse to drive filter
    imp = zeros(n);
    imp(1) = 1;
    % Determine impulse response
    fib = filter(b, a, imp);
    figure;
    plot(fib);
    figure;
    zplane(b,a);
end