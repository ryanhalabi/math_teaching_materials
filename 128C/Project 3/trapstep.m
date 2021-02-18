function [ y ] = trapstep(t,x,h,W)
%   one step of the trapezoid method
z1=ydot(t,x(1,:),W);
g=x(1,:)+h*z1;
z2=ydot(t+h,g(1,:),W);
y=x(1,:)+h*(z1(1,:)+z2(1,:))/2;

end

