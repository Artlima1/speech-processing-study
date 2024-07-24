function sigseg = gluedata(signal,n0,l)
% GLUEDATA   concatenate data segments of one long signal into one new data
%	     vector
%
%	 Usage:	 sigseg = gluedata('signal',n0,l)
%	signal:  the string 'signal' must be the name of data segments 
%		 available in MAT files on your MATLAB path with filenames
%		 'signal_0', 'signal_1'... 
%	    n0:  beginning of signal piece.
%	     l:  length of signal piece.	 
%	sigseg:  signal piece signal(n0:n0+l-1), returned as a column.
%
% GLUEDATA can be used in exercises to maximize the length of used data
% vectors for limited student versions of MATLAB. See the user manual
% for the particular limitations of the array size for your version of
% MATLAB.

%---------------------------------------------------------------
% copyright 1997, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

if nargin~=3
	error('Wrong number of arguments! See help for correct usage.');
end
n0 = round(n0);
if n0<=0
	error('The index n0 has to be larger than 0!')
end
l = round(l);
if l<1
	error('The signal length l has to be larger than 0!')
end
if exist([signal,'_0.mat'])~=2
      error(['Data segments with filenames: ',signal,'_n.mat do not exist!']);
end

sigseg = zeros(l,1);
cn = 0;
cf = 0;
ld = 0;
daseg = [];

while 1
	sicf = [signal,'_',int2str(cf)];
	filename = [sicf,'.mat'];
	if ~exist(filename), break, end
	eval(['load ',filename]); 
	daseg = eval(sicf);
	eval(['clear ',sicf]);
	daseg = daseg(:);
	ld = length(daseg);
	if cn+ld>=n0 & cn<n0+l
		sigseg(max(cn-n0+2,1):min(cn+ld-n0+1,l)) = ...
		daseg(max(1,n0-cn):min(ld,n0+l-1-cn));
	elseif cn>=n0+l
		break;
	end
	cn = cn+ld;
	cf = cf+1;
end



  