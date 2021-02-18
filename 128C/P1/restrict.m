function a = restrict(v)
%this function will take a vector and restrict its elements by a factor of
%ten
k = zeros((length(v)-1)/10+1,1); %restricted vector size



     for j=1:(length(v)-1)/10+1
        k(j) = v(10*j - 9);              
     end 
a = k;


end

