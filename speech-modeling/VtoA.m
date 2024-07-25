function    [r,A] = VtoA(D,A1)

N = length(D)-1;

r = zeros(N, 1);
A = zeros(N, 1);
A(1) = A1;

for k = N:-1:1
    r(k) = D(end);
    D = (D - r(k)*fliplr(D)) / (1-r(k)^2);
    D = D(1:end-1);
end

for k = 1:N-1
    A(k+1) = A(k) * (-1-r(k)) / (r(k) - 1);
end

