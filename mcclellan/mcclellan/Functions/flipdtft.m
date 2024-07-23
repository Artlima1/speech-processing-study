function    [G, Wflipped] = flipDTFT(H, W)
%FLIPDTFT   flip the DTFT:  G(w) = H(-w)
%--------
%    Usage: [G, Wflipped] = flipDTFT(H, W)
%
%      .  H : DTFT values (complex)
%         W : frequency samples
%         G : DTFT values
%  Wflipped : flipped frequency domain
%                 lies within [-pi,pi)

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

N = length(H);   %<--- works only for vectors !!!
Wflipped = -W(N:-1:1);
G = H(N:-1:1);
%---
%--- now get everything back into the [-pi,pi) interval
%---    assume that W was monotonically increasing
%---    so Wflipped is also increasing !
%---
jkl = find( Wflipped(:)' < -pi );
if( ~isempty(jkl) )
    kk = [ (length(jkl)+1):N  jkl ];
    Wflipped(jkl) = Wflipped(jkl) + 2*pi;
    Wflipped = Wflipped(kk);
    G = G(kk);
end
jkl = find( Wflipped(:)' >= (pi-100*eps) );
if( ~isempty(jkl) )
    kk = [ jkl  1:(jkl(1)-1)  ];
    Wflipped(jkl) = Wflipped(jkl) - 2*pi;
    Wflipped = Wflipped(kk);
    G = G(kk);
end
