%Implementation of ######## DFP algorithm. #########

%Clear all command window and workspace
clear;
close all;
clc;

%initial condition
i = 1;
x0 = [1;2;0];
H0 = [1 0 0 ; 0 1 0 ; 0 0 1];
k = 0;
g0 = gradrosen(x0);
Q = hessianrosen(x0);

if g0 == 0
    return;
else
    d0 = -(H0*g0);
end

while g0 ~= 0
    
    uk = [ (x0*(x0.')) / ((x0.')*g0) ] - [ (H0*g0*(H0*g0).') / ((H0*g0).'*g0) ];
    H0 = H0 + uk;
    
    alpha0 = -(g0.'*d0)/(d0.'*Q*d0);
    x1 = x0 + (alpha0 .* d0);
    
    %To hold data of x1,x2,x3 and f(x) create new vectors and store data
    new1(i) = x1(1);
    new2(i) = x1(2);
    new3(i) = x1(3);
    new4(i) = rosen(x1);
    
    g1 = gradrosen(x1);
    
    d1 = -(H0*g1);
    k = k+1;
    g0 = g1;
    d0 = d1;
    error = abs(x1 - x0);
    x0 = x1;

    %Continue iteration to minimize error.
    i = i+1;

    %When iterations meet termination criteria break
    if i==1000
        break;
    end
    if error < 0.01
        break;
    end
    
end


%Print some important points
fprintf("Number of Iteration ==> %d\n\n",i);
fprintf("x1 after %d iteration ==>\n",i);
disp(x0);
fprintf("error after %d iteration ==>\n",i);
disp(error);


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

