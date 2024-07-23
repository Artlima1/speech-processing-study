%
%   EXAMPLE of calling the function radar()
%     make one radar return for a burst of LFM pulses

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

clear,  format compact
T = 10     % microsec
W = 5      % MHz
fs = 10    % MHz, oversample by 2
s = lchirp(T, W, fs/W);

Np = 7;               % 7 pulses
jkl = 0:(Np-1);
T_0 = 200*jkl;        % in usec
g = ones(1,Np);       % gains
T_out = [100 150];    % in usec
T_ref = 0;            % why use anything else?
fc = 10000;           % 10 GHz

Ntargets = 1;
ranges = 20;     % in km ???
amps = 1;
vels = 30;       % in m/sec

y = radar(s,fs,T_0,g,T_out,T_ref,fc,ranges,amps,vels);
