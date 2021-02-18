function [ y] = RK4( t, x, h )
%% this is for solving for y with more accuracy, using runge kutta of order
%  4. ydot is the derivative of y. 
    rk4k1 = h * ydot(t, x(1,:));
    rk4k2 = h * ydot(t + 1/2*h, x(1,:) +1/2*rk4k1);
    rk4k3 = h * ydot(t +1/2*h, x(1,:) + 1/2*rk4k2);
    rk4k4 = h * ydot(t +h, x(1,:) + rk4k3);

    y = x(1,:) +1/6*(rk4k1 + 2*rk4k2 + 2*rk4k3 + rk4k4);
    
end