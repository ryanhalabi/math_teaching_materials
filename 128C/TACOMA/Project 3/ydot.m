function [ ydot ] = ydot(t, y)
% function [ ydot ] = ydot(t,i,y(i,1),y(i,2),y(i,3),y(i,4))
%%% Derivative of y
%% user inputs
len=6;  % (m) half length of bridge (full length is 12 m)
a=0.2; % nonlinearity coefficient
W=80; % windspeed in miles per hour
d=0.1; % damping coefficient
K=1000; % (N) spring constant
omega=2*pi*38/60; % natural frequency of oscillations in bridge
m=2500; % (kg) mass of one foot length, approximates two dimensional 

%% calculations
a1=exp(a*(y(1)-len*sin(y(3))));
a2=exp(a*(y(1)+len*sin(y(3))));
ydot(1)=y(2);
ydot(2)=-d*y(2)-K/(m*a)*(a1+a2-2)+0.2*W*sin(omega*t);
ydot(3)=y(4);
ydot(4)=-d*y(4)+(3*K*cos(y(3)))/(len*a)*(a1-a2);

end

