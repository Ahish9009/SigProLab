function [absError, msqError] = errorCalc(T, T1, t)

toCheck = 40;
absError = zeros(1,toCheck);
msqError = zeros(1,toCheck);
ns = 1:toCheck;

for N=1:toCheck

    [A, y, sq] = squareFS(T, T1, t, N)
    
    absError(N) = max(abs(y-sq))
    msqError(N) = mean((y-sq).^2)

end
plot(ns, absError, 'r', ns, msqError, 'g');
end