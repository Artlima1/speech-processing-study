function x=mulawinv(y,mu)
%       Função para inverso de muLaw
%       x=mulawinv(y,mu)
%               y = input column vector Xmax=1
%               mu = mu law compression parameter
%               x=expanded output vector
Xmax = 32767;
x = (Xmax/mu)*sign(y).*( exp(1).^( (abs(y)/Xmax)*log(1+mu) ) -1); 
end