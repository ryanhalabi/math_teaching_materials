h=1/100;
Nx = 1/h+1;
k = 1/100;
%k=.25*h^2;
Nt = 5*ceil(.2*1/k +1);

lambda = k/h^2;
close all


%diagonals
A = eye(Nx-2,Nx-2);
%off diagonals
B = vertcat( zeros(1,Nx-2),  horzcat( eye(Nx-3, Nx-3), zeros(Nx-3,1) )  )  ;

%construct laplacian matrix

L =(1 + 2*lambda)*A - lambda *(B + B');


%Construct x,t grids

x = zeros(1,Nx);
for i = 1:1:Nx
    x(i) = h*(i-1);
end
t = zeros(1,Nt);
for i = 1:1:Nt
    t(i) = k*(i-1);
end

%fill in initial vector
u = zeros(Nx-2,Nt);
for i = 1:1:Nx-2
    if x(i) <.5
        u(i,1) = 2*x(i+1);
    else
        u(i,1) = 2*(1-x(i+1));
    end
end


%solve problem via backwards difference
for i = 2:1:Nt;
    u(:,i) = L\u(:,i-1);
end

u = vertcat( zeros(1,Nt), u, zeros(1,Nt));


surf(t,x,u)
