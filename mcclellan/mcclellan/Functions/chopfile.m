function chopfile(fname, L)
%CHOPFILE    break a long speech file into several smaller files
%----
%   Usage:  chopfile( 'fname', L )
%
%      'fname' : name of input file 
%               (ASSUMES 'fname.mat' has a variable called fname)
%                output files will be called:
%                  fname_1.mat, fname_2.mat, fname_3.mat, etc.
%           L  : length of output files (default = 1000)

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

if( nargin<2 ),   L = 1000;   end
eval([ 'load ', fname ]);
pt = find(fname=='.');
if( ~isempty(pt) )
   vname = fname( 1:(pt(1)-1) );
else
   vname = fname;
end
if( ~exist(vname) )
   error('>>> VARIABLE name must be same as FILE NAME')
end
eval( ['Lx = length(',vname,');'] )
n1 = 1;
suffix = 0;
while( n1 <= Lx )
   new_name = [vname, '_', num2str(suffix)];
   n2  = min( n1+L-1, Lx );
   eval( [new_name, ' = ', vname, '(n1:n2);'] );
   eval( ['save ',new_name,'.mat ',new_name] );
   suffix = suffix + 1;
   n1 = n1 + L;
end
