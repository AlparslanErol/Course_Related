%Clear all command window and workspace
clear;
close all;
clc;

%initial condition
i = 1;
x0 = [1;2;0];
z0 = randi(3, 3, 1, 1);
k = 0;
alpha = 0.01;


while abs(rosen(x0)-rosen(z0)) > alpha

    if rosen(z0) < rosen(x0)
        x0 = z0;
    else
        x0 = x0;
    end
        %To hold data of x1,x2,x3 and f(x) create new vectors and store data
    new1(i) = x0(1);
    new2(i) = x0(2);
    new3(i) = x0(3);
    new4(i) = rosen(x0);

    %Continue iteration to minimize error.
    i = i+1;
    z0 = randi(3, 3, 1, 1);
    %When iterations meet termination criteria break
    if i==1001
        break;
    end
    
end


%Print some important points
fprintf("Number of Iteration ==> %d\n\n",i);
fprintf("x1 after %d iteration ==>\n",i);
disp(x0);



%Plotting codes
plot(new1);
hold on;
plot(new2);
hold on;
plot(new3);
title('Combined Plots  x1,x2,x3')
axis ([0 i -5 5]);
grid on
legend x1 x2 x3
xlabel('Iteration Number k')
ylabel('Value of x1,x2,x3')
figure;
plot(new4);
title('f(x)')
axis ([0 i -25 2000]);
legend f(x)
xlabel('Iteration Number k')
ylabel('Value of f(x)')
grid on

