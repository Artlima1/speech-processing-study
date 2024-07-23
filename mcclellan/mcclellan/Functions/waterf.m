function   peak_to_peak = waterfall(x, scale)
%WATERF            "Waterfall" Plot
%------
%   Usage:    waterf(X)
%
%        plots the waveforms in X(time,rcvr) vs. "time"
%        Each trace is auto scaled so that the peak-to-peak value
%        is at most 1.0; then each trace is offset by 1 unit.
%
%        NOTE: a scaling of 13 is applied to bunch the plots together.
%
%    waterf(x, A) uses a scale factor of A ==> peak-to-peak will be < A.
%        ex: wp(x, 11.0) will bunch the wfms even closer together.
%
%  NOTE: the hidden line method used in this function is only approximate.
%        It looks OK when the number of time points is >30; otherwise,
%          it is obvious where the mistakes are being made.

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

[N,M] = size(x);
offset = min([0.15*N/M;1]);
Ttemp = [0:(N-1)]'*ones(1,M);
for k = 2:M
   Ttemp(:,k) = Ttemp(:,k) + offset*(k-1);
end
if nargin == 1
  scale = 13.0;                % default scaling
end
peak_to_peak = max(max(x)-min(x));  % RETURN maximum peak-to-peak value
scale = scale/peak_to_peak;
Xtemp(:,1) = scale*x(:,1) + 1;
if M > 1
  for i=2:M    % hidden line "removal", actually adjusts signal values
    ttt = x(:,i)*scale + i;
    ttti = [Xtemp(:,i-1) [Xtemp(2:N,i-1); Xtemp(N,i-1)]]*...
              [1-offset;offset];    % makes mistakes in deep valleys
    Xtemp(:,i) = ttt.*(ttt>=ttti) + ttti.*(ttt<ttti);
  end
end
plot(Ttemp, Xtemp, '-k');       %--- scale wfms
