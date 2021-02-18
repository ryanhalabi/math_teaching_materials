close all

h = .1; %initial step size
ep = 10^-7; %error tolerance
y = -1; %initial y condition
t = 1; %initial time

Y = y; %store solution
T = t; %store time

while t < 2 %loop through time until reach end time point
    
    %solve with 1 h step
    y1 = RK4(y,t,h); 
    %solve with 2 h/2 steps 
    y2 = RK5(y,t,h);
    
 
    %check if passes error test
    if (abs(y1 - y2) < 15*h*ep)
        
        %if passes update t,y,h
        
        %make sure you end up at t = 2
        if t+h < 2
            t = t+h;
        else
            t = 2;
        end
        
        y = y2;
        
        h = .9*h*  ( ( 15*h*ep ) / ( abs(y1 - y2))  )^(.25);

    %store values
   T = [T;t];
   Y = [Y;y];
    else

       %if fails try new h 
      h = .9*h*   (   (15*h*ep ) /  ( abs(y1 - y2) ) )^(.25);

        
    end
    
    
end
 
length(Y)
%plot numerical solution    
plot(T,Y, 'r--o')

%calculate and plot true solution
S = -1./T;
hold on
plot(T,S, 'b')
hold off