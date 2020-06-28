% to close all running codes and its workspace
clc;
clear;
close all;

x = [-3 : 0.01 : 0];
plot(x,f2(x),'r');
axis equal;
xlabel('X')
ylabel('f2(x)')
title('Problem 2.a')
grid on
legend('f2(x)')