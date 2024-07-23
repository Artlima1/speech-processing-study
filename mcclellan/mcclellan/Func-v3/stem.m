function stem(x, y, linetype)
%STEM   Plot discrete-time sequence data.
%----
%   stem(Y) plots the data sequence Y as stems from the x-axis
%           terminated with circles for the data value.
%   stem(X,Y) plots the data sequence Y at the values
%              specfied in X.
%   stem(X,Y,'-.') or stem(Y,':').
%             The optional final string argument specifies
%              a line-type for the stems of the data sequence.

%*** This is a modified Mathworks M-file. ******

n = length(x);
if nargin == 1
    y = x(:)';
    x = 1:n;
    linetype = '-';
elseif nargin == 2
    if isstr(y)
        linetype = y;
        y = x(:)';
        x = 1:n;
    else
        x = x(:)';
        y = y(:)';
        linetype = '-';
    end
elseif nargin == 3
    x = x(:)';
    y = y(:)';
end
xx = [x;x];
yy = [zeros(1,n);y];
plot(x,y,'ro',xx,yy,['r' linetype])
q = axis;hold on;plot([q(1) q(2)],[0 0],'w-');axis;hold off;
