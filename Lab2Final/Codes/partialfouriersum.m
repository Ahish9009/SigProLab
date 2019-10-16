% Function to compute Partial Fourier Sum
function x = partialfouriersum(A, T, t)
    % Initialize result array with '0'
    x = zeros(size(t));
    % Compute limit of k from the equation:
    % size(A) = 2*N+1
    N = (size(A,2)-1)/2;
    % Iterate through the values of k (-N to N)
    for k = -N:N
        x = x + A(k+N+1)*exp(1i*k*2*pi*t/T);
    end
    % Plot the results
    plot(t, x);
    title('Partial Fourier Sum');
    xlabel('Time');
    ylabel('x(t)');
end