
function ydot = ydot(t,y)

len = 6;
a = .2;
W= 200;
omega = 2*pi*38/60;
a1 = exp(a*(y(1) - len*sin(y(3))));
a2 = exp(a*(y(1) + len*sin(y(3))));

ydot(1) = y(2);
ydot(2) = -.01*y(2) - .4*(a1 + a2 -2)/a + .2*W*sin(omega*t);
ydot(3) = y(4);
ydot(4) = -.01* y(4) + 1.2*cos(y(3)) * (a1 - a2)/(len*a);

end
