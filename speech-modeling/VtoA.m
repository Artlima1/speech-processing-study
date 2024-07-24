function    [r,A] = VtoA(D,A1)

N = length(D);

r = zeros(N, 1);
A = zeros(N+1, 1);
A(end) = A1;

for k = N:-1:1
    r(k) = D(end);
    D = (D - r(k)*fliplr(D)) / (1-r(k)^2);
    D = D(1:end-1);
    A(k) = A(k+1) * (1+r(k));
end
