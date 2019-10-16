function newA = hPartC(A,N)

%     initialize new frequency coefficients
    newA=zeros(2*N+1);    
%     iterates over the frequency values 
    for k=-N:N
%         applies the transfer function in part c
        newA(k+N+1) = (1./ (1+ (1i.*(k)) ) ).*A(k+N+1);       
    end
        
end
