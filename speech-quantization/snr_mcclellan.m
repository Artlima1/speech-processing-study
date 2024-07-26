function        [s_n_r,e] = snr_mcclellan(xh,x)
%        Fucntion to compute signal-to-noise ratio
%        [s_n_r,e] = snr(xh,x)
%               xh = quantized signal
%               x=unquantized signal
%               e=quantization error signal
%               s_n_r= snr in dB
    e = xh-x;
    s_n_r = 10 * log10( sum(x.^2) / sum( (e).^2 ));
end