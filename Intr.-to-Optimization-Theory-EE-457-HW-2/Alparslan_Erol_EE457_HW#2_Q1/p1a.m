clc;
clear;
close all;
    
x = [2 : 0.01 : 10];
plot(x,f(x),'r')
axis equal
xlabel('X')
ylabel('f(x)')
title('Problem 1.a')
grid on
legend('f(x)')