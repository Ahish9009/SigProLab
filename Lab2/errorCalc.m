% Function to compute Max Error and Mean Square Error
% for value of N varying from 1 to 100
function [maxErr, sqErr] = errorCalc(T,T1,t)
    % Initialize the result arrays with '0'
    maxErr=zeros(1, 100);
    sqErr=zeros(1, 100);
    % Iterate through values of N
    for i = 1:100
        % Get the ideal square wave and the 
        % reconstructed wave from the function squareFS()
        [A, y, sq] = squareFS(T,T1,t,i);
        % Compute max error
        maxErr(i) = max(abs(y-sq));
        % Compute mean squared error
        sqErr(i) = mean(abs(y-sq).^2);
    end
    % Plot the variation of both errors with N
    plot(1:100, sqErr, 'r', 1:100, maxErr, 'g');
    title('Variation of Mean Sq Error and Max Absolute Error with N');
    xlabel('N');
    ylabel('Error');
    legend('Mean Square Error', 'Max Absolute Error');
end