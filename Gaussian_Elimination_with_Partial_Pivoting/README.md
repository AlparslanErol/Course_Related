# Gaussian_Elimination_with_Partial_Pivoting

## Introduction
In this project you have to create 2 files that are named "A.txt" and "B.txt"
and write the components of Matrix A and vector B that you use while using Gaussian 
elimination in that text files in the same location that you create your new project.
Then you just compile the code in "source.cpp".

## Input Files
The "A.txt" file ,which used for initialization Matrix A, must be a square matrix and
the "B.txt"file , which used for initialization Vector B, must have the same row number with "A.txt".

## Specificatioons
After you compile and run the program, "X.txt" file will be created. Program finds 
the values of Vector X ,which is a solution vector, and writes its values in this file.
This program uses Gaussian elimination with partial pivoting method.
If your matrix is a singular one, the program will warn you and write "it is a singular matrix."
The machine precision for this program is designed for 1E-7. Values below this point are declared as zero. 
If the matrix is 2x2 it calculates the condition numbers at norm 1 and norm infinity.
If it has high condition numbers it is called ill-conditioned. So program can not calculate
high condition numbers.

## Input Set Example

Following values which were given in the project description file
while calculating condition numbers was used.

A:

1.000 1.000

1.000 1.001

b1:		b2:

2.000		2.000

2.000		2.001
