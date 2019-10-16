% Function to compare ideal square wave and that 
% obtained from Fourier series reconstruction 
function [sq, A] = squareFS(T,T1,t,N)
    % Initialize Coefficent Array 'A' with '0'
    A = zeros(2*N+1);
    % Number of time divisions 
    div = size(t,2);
    
    % Iterate through values of 'k' (-N to N)
    for k = -N:N
        % Iterate through instances of time 
        for i = 1:size(t,2)
            % If the time instance lies in (-T1, T1), amplitude 
            % is '1', else it is '0'
            if (abs(t(i)) < T1)
                A(k+N+1) = A(k+N+1) + exp(-1*1i*2*pi*t(i)*k/T);
            end
        end
    end
    
    % Divide all coefficents by number of divisions as in fourmula
    A = A/(div);
    % Compute Fourier partial sum from the previous code  
    y = partialfouriersum(A,T,t);
    % Determine the ideal periodic square pulse at the given time samples
    sq = rectangularPulse(-T1, T1, t);
    
end