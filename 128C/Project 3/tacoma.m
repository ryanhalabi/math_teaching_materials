clc;
close all;
clearvars;

%% user defined parameters
h=0.1;
len=6; 
a=0;
b=600;
n1 = ceil((b-a)/(h)); % used to plot y(t) and theta(t) 

%% Initial Conditions; y(1,1) = y, y(1,3) = theta, 
ic=[0 0 .5 0]; % ic=[y(1,1) y(1,2) y(1,3) y(1,4)];
y(1,:)=ic;  % for passing values through iteration loop to outside
t(1)=a;




%% plot setup
clf; % clear current figure
set(gca, 'XLim',[-8 8], 'YLim',[-25 25], 'XTick',[-8 0 8], 'YTick',...
    [-25:5:25],'Drawmode','fast','Visible','on','NextPlot','add');
cla; % clear current axis
axis square % make aspect ratio 1 to 1
road=line('color','b','LineStyle','-','LineWidth',5,'erase', 'xor','xdata',[],'ydata',[]);
lcable=line('color','r','LineStyle','-','LineWidth',1,'erase','xor','xdata',[],'ydata',[]);
rcable=line('color','r','LineStyle','-','LineWidth',1,'erase', 'xor','xdata',[],'ydata',[]);
    

for j=1:n1      

    t(j+1)=t(j)+h;
    y(j+1,:)=RK4(t(j),y(j,:),h);
    c = len*( cos(y(j+1,3))  );
s = len*sin(y(j+1,3));
    set(road, 'xdata', [-c c], 'ydata', [-s - y(j+1,1) s-y(j+1,1)])
    set(lcable, 'xdata', [-c -c], 'ydata', [-s - y(j+1,1) 8])
    set(rcable, 'xdata', [c c], 'ydata', [s - y(j+1,1) 8])
    drawnow;
title( t(j+1) )
end


       
        %% y(t) graph 
        subplot(2,1,1)
        plot(t,y(:,1),'.b');       % Adds a scatter plot for (t,y(t))
        title('y(t)')

        subplot(2,1,2)
        %% theta(t) graph
        plot(t,y(:,3),'.r');   % Adds a scatter plot for (t,y(t))
        title('\theta(t)')

 max(abs( y(:,3)))/y(1,3)
        

