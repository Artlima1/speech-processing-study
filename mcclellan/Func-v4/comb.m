function comb(x, y, linetype)
%COMB   Plot discrete-time sequence data.
%----
%   COMB(Y) plots the data sequence Y as stems from the x-axis
%           terminated with circles for the data value.
%   COMB(X,Y) plots the data sequence Y at the values
%              specfied in X.
%   COMB(X,Y,'-.') or COMB(Y,':').
%             The optional final string argument specifies
%              a line-type for the stems of the data sequence.

%*** This is a Mathworks M-file. It has been  ******
%***   RENAMED TO stem( ) in MATLAB Ver 4.0   ******

stem( x, y, linetype );   %<-- just call the new function
