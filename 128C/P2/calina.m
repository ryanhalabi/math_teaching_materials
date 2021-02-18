close all

h = .1; %initial step size
y = 1.01; %initial y condition
t = 0; %initial time

Y = y; %store solution
T = t; %store time

while t < 15 %loop through time until reach end time point
    
    %solve with 1 h step
    y = RK(y,t,h)

    
t = t+h
       
   T = [T;t];
   Y = [Y;y];
   %testing something really fast
    
end
 
length(Y)
%plot numerical solution    
plot(T,Y, 'b')


%calculate and plot true solution
S = (1+.01*exp(-T/2));
hold on
plot(T,S, 'r--o')
hold off