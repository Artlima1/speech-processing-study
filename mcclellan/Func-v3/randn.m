function R=randn(M,N)
% RANDN  Normally distributed random numbers and matrices from
%	 a normal distribution with mean 0.0 and variance 1.0.
% usage:
% 		R = randn(M,N)
%
%	R: matrix of random values
%	M: number of rows of R
%	N: number of columns of R
%
% See: rand

rand('normal');
R = rand(M,N);
rand('uniform');
