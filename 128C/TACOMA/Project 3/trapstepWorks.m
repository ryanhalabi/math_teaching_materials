function [ y ] = trapstep(t,x,h )
%   one step of the trapezoid method
z1=ydot(t,x(1,:));
g=x(1,:)+h*z1;
z2=ydot(t+h,g(1,:));
y=x(1,:)+h*(z1(1,:)+z2(1,:))/2;

end

