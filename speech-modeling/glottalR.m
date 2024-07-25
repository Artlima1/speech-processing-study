function  [gR, GR, W] = glottalR(N1, N2, Nfreq)     
    gR = zeros(1, N1+N2+1);
    
    for n = 1:(N1+N2+1)
        if n < N1
            gR(n) = 0.5*(1-cos(pi*n/N1));
        elseif n <= N1+N2
            gR(n) = cos(pi*(n-N1)/(2*N2));
        end
    end
    
    GR = fft(gR, Nfreq);
    W = 0:pi/Nfreq:(1-1/Nfreq)*pi;