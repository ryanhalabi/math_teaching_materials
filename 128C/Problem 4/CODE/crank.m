close all
clear all

h=1/10;
Nx = 1/h+1;
k = 1/100;
%k=.25*h^2;

Nt = ceil(.2*1/k +1);

lambda = k/h^2;


%diagonals
A = eye(Nx-2,Nx-2);
%off diagonals
B = vertcat( zeros(1,Nx-2),  horzcat( eye(Nx-3, Nx-3), zeros(Nx-3,1) )  )  ;

%construct laplacian matrix

L =(2 + 2*lambda)*A - lambda *(B + B');
LF =(2 - 2 * lambda)*A + lambda *B + lambda*B';



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


%solve problem via crank difference
for i = 2:1:Nt;
    u(:,i) =  L\( LF*u(:,i-1) );
end

u = vertcat( zeros(1,Nt), u, zeros(1,Nt));

surf(t,x,u)

AA = zeros(Nx,Nt);

for i = 1:1:Nx
for j = 1:1:Nt
  AA(i,j) = analytic(x(i),t(j),2000);
end
end


%difference between analytic and numerical solution
e = u - AA;

subplot(1,3,1)
a = surf(t,x,u)
axis square
title(['numerical'])
subplot(1,3,2)
b = surf(t,x,AA)
axis square
title(['analytic'])
subplot(1,3,3)
c = surf(t,x,e)
axis square
title(['error'])

set(a,'LineStyle','none')
set(b,'LineStyle','none')
set(c,'LineStyle','none')