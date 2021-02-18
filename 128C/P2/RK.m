function w1 = RK(y,t,h)

w0 = y;
k1 = h*f(t,w0);
k2 = h*f(t + h/2, w0 + 1/2*k1);
k3 = h*f(t + h/2,w0 + 1/2*k2);
k4 = h*f(t + h, w0 + k3);

w1 = w0+ 1/6*(k1 + 2*k2 + 2*k3 + k4);

end

