# Projectile Motion Solving Equations Using Euler's Method Computer Simulation
PJATK PSM Task_2

- This program is a Python based program that can simulate projectile motion of an object w/ and w/o drag force by using both "Euler Method"and "Improved Euler Method"
- All of the cases above are implemented and at the end, program will give you a plot.


## Euler Method          

- f(x0+dx)=f(x0)+f'(x0)*dt

## Improved Euler Method

- f(x0+dx)=f(x0)+f'(x0+dt/2)

## W/ Drag Force Case

Fx = (-kVx)     --force
Fy = (m*gy-kVy) --force

By the way...

Ax = Fx/m --accelaration
Ay = Fy/m --acceleration

## W/o Drag Force Case

Fx = 0      --force
Fy = (m*gy) --force

By the way...

Ax = 0  --accelaration
Ay = gy --acceleration

## Arguments for Inputation

- Initial angle of launch
- The delta time step of the motion
- Launch velocity
- Gravitational Acceleration
- Resistance force constant
- Resistance force constant

## License
[MIT](https://choosealicense.com/licenses/mit/)

## Github
[GITHUB](https://github.com/AlparslanErol/Projectile_Motion_with_Euler_Method/)
