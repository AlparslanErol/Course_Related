% to close all running codes and its workspace
clc;
clear;
close all;

%To implement secant method we need x0 and x-1 initial value
xm1 = 0;
x0 = 1;
%iterate since uncertainity < epsilon
epsilon = 10^(-5);
%As in Newton's method, problem can solve the roots of g(x)=0
%So f'(x) = g(x) and we know that given g(x) is the derivative form of the
%main function. So when we detect roots of the g(x), actually we detect
%roots of f'(x) which gives us the minimum points of the function.
x1 = x0 - ( ( x0 - xm1)  / (g(x0) - g(xm1)) ) * g(x0);

uncert = abs(x1 - x0);
i=1;

while uncert > epsilon
    
    fprintf('Number of Iteration is ==> %d ------ Fucntion Value of X(k) ==> %f ------ Uncertainity Interval ==> %f\n',i,g(x1),uncert);  
    fprintf('Minimizer ==> %f\n' ,x1);
    fprintf('\n');
    %Secant algorithm applied
    %you can easily observe we detect point where g(x)=0 when you run this
    %code and just chech Function Value ==> 0.000000000
    xm1 = x0;
    x0 = x1;
    x1 = x0 - ( ( x0 - xm1)  / (g(x0) - g(xm1)) ) * g(x0);
    uncert = abs(x1 - x0);
    i = i+1;
    
end
    % to print last iteration results I attached this print functions
    fprintf('Number of Iteration is ==> %d ------ Fucntion Value of X(k) ==> %f ------ Uncertainity Interval ==> %f\n',i,g(x1),uncert);  
    fprintf('Minimizer ==> %f\n' ,x1);