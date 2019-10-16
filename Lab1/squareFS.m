function [A,y,sq] = squareFS(T,T1,t,N)

A = zeros(1,2*N+1);
% total = size(t,2);
w = 2.*pi./T;
y = 0;
sq = 0;
step = (t(end)-t(1))./size(t, 2);

for k=-N:N
    
    for n=1:T./step
        tim=t(n);
        
        if abs(tim)<T1
        
            A(k+N+1) = A(k+N+1) + exp(-j.*k.*w.*tim);
    
        end
%         A(k+N+1) = (1./T).*A(k+N+1);
    end
    
%           A(k+N+1) = (1./T).*A(k+N+1);

 A = A./T;
y = partialfouriersum(A, T, t);

sq=rectangularPulse(-T1, T1, t)

plot(t, sq, 'r', t, y, 'g');

end
end
