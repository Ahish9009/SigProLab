function newA = hHighPass(A,N)

%     new frequency coefficients after applying transfer function
    newA=zeros(2*N+1);
%     iterates over the frequency values
    for k=-N:N
%         sets the frequency cutoff threshold to 3
        if (abs(k) >= 3)
            newA(k+N+1) = 1.*A(k+N+1);
        end
    end
        
end
