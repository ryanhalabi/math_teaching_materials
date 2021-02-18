function [ answer ] = pan( h,k )

format longeng;
approx = zeros(10);
lambda = k/(h^2);
matrix = zeros(10);

%get the tridiagonal matrix
for i = 1:10
    matrix(i,i) = (1-2*lambda);
end

for i = 1:9
    matrix(i,i+1) = lambda;
end

for i = 1:9
    matrix(i+1,i) = lambda;
end

counter = 1;
%get the w(i,0) values. i = 1,2,...m-1
for x = 0:.1:1
    u = sin(pi*x);
    if x ~= 0
        approx(1,counter) = u;
        counter = counter + 1;
    end
end

%each iteration transposes a w-vector, multiplies to the tridiagonal, and
%puts the new w-vector into the next row of approx
for i = 1:9
    temp = approx(i,:)';
    approx(i+1,:) = matrix*temp;
end

answer = approx;

end