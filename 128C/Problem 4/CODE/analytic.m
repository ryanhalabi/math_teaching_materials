function [ y ] = analytic( x,t,N )
%computes analytic solutin at (x,t) using N terms

a = 0;


for n=1:1:N

a = a + 8/pi^2 *1/n^2 * sin(n*pi/2) * sin(n * pi *x) * ...
     exp(-n^2 *pi^2 * t);
end

y = a;
