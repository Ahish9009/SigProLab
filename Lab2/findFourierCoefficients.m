function [A,y,sq] = findFourierCoefficients(T,x,t,N)
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

            
            A(k+N+1) = A(k+N+1) + (x(i)).*exp(-1*1i*2*pi*t(i)*k/T);
         
        end
    end
    
    % Divide all coefficents by number of divisions as in fourmula
    A = A/(div);
   
    
end
    