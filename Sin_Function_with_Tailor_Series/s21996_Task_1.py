# -*- coding: utf-8 -*-
"""
Created on Mon Mar 23 22:35:35 2020

@author: ALPARSLAN
"""

# Python3 code for implementing  
# sin function   
from math import sin, radians, factorial


# Function for calculating sin value 
def cal_sin(n): 
    """Compute Taylor series approximation of the sine function.
    
    Args:
        n: Angle that wanted to calculate with sin() function approximation.
    Returns:
        The numeric approximation.
    """
    accuracy = 0.00001; 
            
    x = n; 
      
    # maps the sum along the series 
    sinx = 0;      
      
    # holds the actual value of sin(n) 
    sinval = sin(n);  
    i = 0; 
    while(True):
        sinx += (-1)**i * x**(2 * i + 1) / factorial(2 * i + 1)
        i = i + 1; 
        print("###### Iteration number {}... ######".format(i))
        print("Sin from Calculator is:    {:.6f}".format(sinval))
        print("Sin from Taylor Series is: {:.6f}".format(sinx))
        print("\n")
        if(accuracy >= abs(sinval - sinx)):
            print("Program is finilazed... Difference Between Taylor and Calcultor is: {:.6f}".format(abs(sinval - sinx)));
            break; 
    return sinx
    

print ('\n')
print("Welcome to Computer Program to Compute sin(x) with a Special Taylor Series Expansion as Maclauren Series!", '\n')

theta = float(input("Enter Angle that you want to calculate sin() function from 0 Degree to 360 Degree: "))
print("\n")
theta = radians(theta) #Initial angle of launch
cal_sin(theta); 