function peak_to_peak = wp(x, scale)
%WP             multi-channel waveform plotter
%--  
%   usage:    wp(X)
%
%     plots the waveforms in the signal matrix X(time,rcvr) vs. "time"
%        Each trace is auto scaled so that the peak-to-peak value
%        is at most 1.0; then each trace is offset by 1 unit.
%     Optional: wp will return computed peak-to-peak scaling
%
%    wp(X, A) uses a scale factor of A ==> peak-to-peak will be < A.
%        ex: wp(X,3.0) will bunch the wfms closer together like an image.
%
%   NOTE: x-axis is always labeled with (time) indices.
%
%   see also WATERF

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------


if nargin == 1
   scale = 1.0;          %--- default scaling
end
peak_to_peak = max(max(x)-min(x));  %-- RETURN max peak-to-peak value
scale = scale/peak_to_peak;
[M,N] = size(x);
x = scale*x;           %--- scale wfms
for k=1:N
   x(:,k) = x(:,k) + k;   %--- offset each column
end
plot( x, '-k');     % scale wfms
