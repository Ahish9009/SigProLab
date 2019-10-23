function y = overlapadd(h,x,N)

% If N is not already a power of 2, replace it with the next power of 2
N = 2^(nextpow2(N));

% Compute important lengths
M = length(h);
L = N-M+1;
Lx = length(x);

% Length-N DFT of filter

H = fft(h, N);

% Initialize y (include some extra zeros at end)
y = zeros(1,Lx+N);
r = rem(Lx, L);
% Pad x with zeros to be a multiple of L
x = [x, zeros(1,L-r)];

% How many blocks will we have?
K = length(x)/L;

for k=1:K
    block = x(((k-1)*L+1):k*L)
    if k==1
        block1=[block zeros(1,M-1)];
    else 
        block1=[block((L-M+2):L) block];        
    end
    B = fft(block1(k,:))
    yblock = ifft(B.*H)
     
    % If first block, initialize y
    if k==1
        y(1:N) = yblock;
    else  % Add the result to the appropriate location in y
        y(k*L) = y((k*L)) + yblock;
    end
end

plot(y)

% Trim extra zeros from the end of y to get the correct length convolution

y = y(1:Lx+M-1);
y