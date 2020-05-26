function y = mydft(x)
nx=length(x);
y=zeros(size(x));% y = {X[0],X[1],...X[N-1]}
%% Write your DFT here
for k=0:(nx-1)
    for n=0:(nx-1)
        y(k+1) = y(k+1)+x(n+1)*exp((-1i*2*pi*k*n)/nx);
    end
end