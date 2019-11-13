function y = partialfouriersum(A,T,t)

y = zeros(size(t));
w = 2.*pi./T;
N = (size(A, 2)-1)./2;

for x=1:size(t,2)
        for k=-N:N
            y(x) = y(x) + A(k+N+1).*exp(j.*k.*w.*t(x));
        end
end


plot(t, (y));

end
