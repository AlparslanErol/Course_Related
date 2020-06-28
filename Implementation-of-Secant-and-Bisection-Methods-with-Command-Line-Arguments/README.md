# Implementation-of-Secant-and-Bisection-Methods-with-Command-Line-Arguments
In this project I implemented secant and bisection algorithms in order to solve for any given polynomial f. This program takes the coefficients of the function, initial guesses and the tolerance value as command line arguments and return the resulting values of x as well as the numbers of iterations for each method.

# Introduction 

To design this program bisection and secant methods are used to solve f(x) = 0
for any given poynomial. Program runs with at least 5 command line argument line,
otherwise it gives an error message to you! 

===> At least 5 Command Line Arguments distrubution:

===> At least 3(float) of them are used for to set polynomial, whether polynomial
     is n'th order then you have to give n+1 command line argument for polynomial set.

===> 2 Initial result guesses that X2 < result < X1 
     So you have to give X2 < X1 in correct sequence, otherwise you'll get an eror message.

===> Last order command line argument is tolerance. 
     You have to initialize tolerance as => 0.001

As a result you should write:

		"2 2 -7 1 -7 1.5 1.8 0.001"

Program takes the coefficients of the polynomial, initial guesses and the tolerance
value as command line arguments. Both bisection and secant methods are implemented 
seperately.To find the resul of hybrid method, 2 arguments as initial guesses are kept 
from the outputs of bisection method after second iteraiton then these kept values are 
used as 2 input in hybrid method. Program starts with bisection methods for the first 
two iterations and then continued with secant method for the rest of the iterations. 
This program prints out the number of iterations required for each of the 3 methods
(i.e., bisection, secant, and hybrid).


All rights are reserved ...:D
