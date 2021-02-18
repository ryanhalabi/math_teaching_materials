%% main function 
% Josh Grant - MAT 128C
% Project 3 - 5/28/14
close all
%% user defined parameters
h = 0.01; % step size
p = 100; % number of steps per point
a = -6;
b = 6;
n = ceil((b-a)/(h*p)) % rounds result up to nearest integer


%%
t=zeros([p+1,1]);
y=zeros([p+1,4]);
int=[a b];
ic=[0 0 0.001 0];
% ic=[y(1,1) y(1,2) y(1,3) y(1,4)];   %y(1,1) = y, y(1,3) = theta
y(1,:)=ic; % first row of y matrix is initial conditions
t(1)=a; % first time point is a
len=6; 

%% plot setup
clf; % clear current figure
set(gca, 'XLim',[-8 8], 'YLim',[-25 25], 'XTick',[-8 0 8], 'YTick',...
    [-25:5:25],'Drawmode','fast','Visible','on','NextPlot','add');
cla; % clear current axis
axis square % make aspect ratio 1 to 1
road=line('color','b','LineStyle','-','LineWidth',5,'erase',...
    'xor','xdata',[],'ydata',[]);
lcable=line('color','r','LineStyle','-','LineWidth',1,'erase',...
    'xor','xdata',[],'ydata',[]);
rcable=line('color','r','LineStyle','-','LineWidth',1,'erase',...
    'xor','xdata',[],'ydata',[]);
    

%% iteration
for k=1:n
    for i=1:p
        t(i+1)=t(i)+h;
        y(i+1,:)=trapstep(t(i),y(i,:),h);
        i;
    end
    y(1,:)=y(p+1,:);
    t(1)=t(p+1);
    z1(k)=y(1,1);
    z3(k)=y(1,3);
    c = len * cos(y(1,3));
    s = len * sin(y(1,3));
    set(road, 'xdata', [-c c], 'ydata', [-s - y(1,1) s-y(1,1)])
    set(lcable, 'xdata', [-c -c], 'ydata', [-s - y(1,1) 8])
    set(rcable, 'xdata', [c c], 'ydata', [s - y(1,1) 8])
    drawnow;
end