close all

y = cell(3,1); %cell that contains solution at different resolutions
e = cell(3,1); % cell that contains error at different resolutions
t = cell(3,1); % time cell
r = cell(3,1); % real solution cell

for i = 1:3;   %cycle through 10^-3 to 10^-5 resolution

%% set constants 
    
    h = 10^(-(i+2)); %set spatial grid size

    t{i} = zeros(20*10^(i+2)+1,1); %create time vector
    
    for j=1:20*10^(i+2)+1
        t{i}(j) = -10+ (j-1)*10^(-(i+2)); %fill in time vector
    end
    

    y{i} = zeros(20*10^(i+2)+1,1);  %create solution vector
    y{i}(1) = 1/(10^4 +1); %enforce left boundary condition
    
    
    
%% Solve equation
%     
%     %EULERS METHOD
%     for j=2:20*10^(i+2)+1
%         y{i}(j) = y{i}(j-1) + h*    f(  y{i}(j-1), t{i}(j-1) );
%     end     
    
    %MODIFIED EULERS METHOD
    for j=2:20*10^(i+2)+1
        y{i}(j) = y{i}(j-1) + h/2* (   f(  y{i}(j-1), t{i}(j-1) )                  +       f( y{i}(j-1) +  h*f(  y{i}(j-1), t{i}(j-1) )   ,t{i}(j)   )               );
        
    end
    

%     




    
    
%% compute real solution
    r{i} = zeros(20*10^(i+2)+1,1);
    r{i}(1,1) = 1/(10^4 +1);
    
    for j=2:20*10^(i+2)+1
        r{i}(j) = 1/(1+t{i}(j)^4);
    end 
    
    
%% plot real and numerical solution    
plot(t{i},y{i})
hold on
plot(t{i},r{i})


%compute max error
e{i} = max( abs(r{i} -y{i}) );
end
e







%restrict all our data from above to same size as 10^-3 data
D4 = restrict(y{2});
D5 = restrict(y{3});
%restrict to 10^-4 data size
D55 = restrict(restrict(y{3}));



%% Richardson extrapolation using 10^-3, 10^-4 O(h^2)

R34 = zeros(20*(10^(3))+1,1);


    %extrapolation
     for j=1:20*(10^(3))+1
        R34(j) = -1/9*y{1}(j) + 10/9*D4(j) ;                
     end   
     figure
    plot(t{1},R34)    
    max( abs( r{1} - R34))
    
    
    
    
    
    
    
%% Richard extrapolation using 10^-4 and 10^-5 O(h^2)


R45 = zeros(20*(10^(4))+1,1);


     for j=1:20*(10^(4))+1
        R45(j) = -1/9*y{2}(j) + 10/9*D5(j) ;                
     end   
     figure
    plot(t{2},R45)
    max( abs( r{2} - R45))
    
 
    
    
    
%% Richardson extrapolation using the 10^-3,-4-5, O(h^3)
    

R345 = zeros(20*(10^(3))+1,1);
    %RICHARDSON EXTRAPOLATION
   
A = restrict(R45);


%compute the O(h^3) solution
     for j=1:20*(10^(3))+1
        R345(j) = -1/99*R34(j) + 100/99*A(j);
     end  
     
    figure
    plot(t{1},R345)
    
    
    max( abs( r{1} - R345))
    
    
    
    
    
    