clear all
close all
h = .1;  %spacing
a = 0;  %start
b = 2000; %end
len = 6;

n = ceil( (b-a)/h);

y(1,:) = [1,.1,.5,0]; % y y' theta theta'

t(1) = a;


%% plot setup
clf; % clear current figure
set(gca, 'XLim',[-8 8], 'YLim',[-25 25], 'XTick',[-8 0 8], 'YTick',...
    [-25:5:25],'Drawmode','fast','Visible','on','NextPlot','add');
cla; % clear current axis
axis square % make aspect ratio 1 to 1
road=line('color','b','LineStyle','-','LineWidth',5,'erase', 'xor','xdata',[],'ydata',[]);
lcable=line('color','r','LineStyle','-','LineWidth',1,'erase','xor','xdata',[],'ydata',[]);
rcable=line('color','r','LineStyle','-','LineWidth',1,'erase', 'xor','xdata',[],'ydata',[]);
    



for i =1:n
    
    t(i+1) = t(i) + h;
    
    y(i+1,:) = trapstep(t(i),y(i,:),h);
    %y(i+1,:) = RK4(t(i),y(i,:),h);
    y(i+1,1)
c = len*( cos(y(i+1,3))  );
s = len*sin(y(i+1,3));
    set(road, 'xdata', [-c c], 'ydata', [-s - y(i+1,1) s-y(i+1,1)])
    set(lcable, 'xdata', [-c -c], 'ydata', [-s - y(i+1,1) 8])
    set(rcable, 'xdata', [c c], 'ydata', [s - y(i+1,1) 8])
    drawnow;
pause(.01)

end
figure

subplot(2,1,1)
%hold all
plot(t,y(:,1))
title('height')
xlim([a b])
subplot(2,1,2)
%hold all
plot(t,y(:,3))
title('angle')
xlim([a b])



max(abs(y(:,3)))/y(1,3)



