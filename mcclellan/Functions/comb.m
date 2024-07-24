function comb(x, y, linetype)
%COMB   Plot discrete-time sequence data.
%----
%   COMB(Y) plots the data sequence Y as stems from the x-axis
%           terminated with circles for the data value.
%   COMB(X,Y) plots the data sequence Y at the values
%              specfied in X.
%   COMB(...,'LINESPEC') uses the linetype specifed for the stems and
%                        markers.  See PLOT for possibilities.
%
%   See also: stem

%*** This is a Mathworks M-file. It has been  ******
%***   RENAMED TO stem( ) in MATLAB Ver 4.0   ******
%***   and received new features in Ver. 5.0  ******

if nargin <3
   linetype = '-';
end
if nargin <2
   y = x;
   x = 1:length(y);
end

stem( x, y, linetype );   %<-- just call the new function
