# -*- coding: utf-8 -*-
"""
Created on Mon Mar 23 04:46:36 2020

@author: ALPARSLAN
"""


from math import sin, cos, radians
import matplotlib.pyplot as plt


print ('\n')
print("Welcome to Projectile Motion Solving Equations Using Euler's Method Computer Simulation!", '\n')

# CONFIGS
# =============================================================================
theta = float(input("Enter Initial Launch Angle of the Object from 0 Degree to 360 Degree: "))
theta = radians(theta)                                              # Initial angle of launch
dt = float(input("Enter The time step of the motion in (sec): "))   # The delta time step of the motion
v = float(input("Enter Launch velocity in (m/s): "))                # Launch velocity
g = float(input("Enter Gravitational Acceleration in (m/s*s): "))   # Gravitational Acceleration
k = float(input("Enter Resistance Force Consant: "))                # Resistance force constant
m = float(input("Enter Mass of the object in(kg): "))               # Mass of the object
t = 0.0                                                             #Starting time
x = 0.0
y = 0.0
vx,vy = v*cos(theta), v*sin(theta)  # Initial vertical and horizontal speeds
a_x0 = 0.0                          # Horizontal forces without drag force case.
a_x1 = -(k*vx)/m                    # Horizontal forces with drag force case.
a_y0 = -g                           # Only gravitational force.
a_y1 = (-g-(k*vy)/m)                # Both drag force and gravitational force.
Max_Height_0 = 0.0                  # Maximum Height,initially set to zero
Max_Height_1 = 0.0                  # Maximum Height,initially set to zero
xa_0 = list()
ya_0 = list()
xa_1 = list()
ya_1 = list()
xa_2 = list()
ya_2 = list()
xa_3 = list()
ya_3 = list()
# =============================================================================


# ITERATIVE ALGORITHM USING EULER'S METHOD FOR MOTION WITHOUT DRAG FORCE
# =============================================================================
while y >= 0: #Follow the ball while it hasn't gone below the y position of its initial position
     xa_0.append(x)		     # add x to the x array
     ya_0.append(y)          # add y to the y array

     
     # Use Euler's algorithm
     y = y + vy * dt        
     x = x + vx * dt
     vy = vy + a_y0 * dt
     vx = vx + a_x0 * dt
     t = t + dt #Step up the time
     if y > Max_Height_0: #Update the value of the Maximum Height whenever a larger value of y is found
          Max_Height_0 = y 
# =============================================================================
xa_0.append(x)		    # add x to the x array
ya_0.append(y)          # add y to the y array


# PRINT EACH ITERATION VALUE FOR X AXIS AND Y AXIS
# =============================================================================
for num in range(len(xa_0)):
    print("Iteration {} X-axis value is: {:.3f}".format(num, xa_0[num]))
    
for num in range(len(ya_0)):
    print("Iteration {} Y-axis value is: {:.3f}".format(num, ya_0[num]))

print("\n")    
print("Total Iteration Number is: {}".format(len(xa_0)))
print("\n")      
print ("Total flight time:%.3f seconds Range of projectile:%.3f meters Maximum height is:%.3f meters" %(t,x,Max_Height_0))  
# =============================================================================


# RE-CONFIG
# =============================================================================
vx,vy = v*cos(theta), v*sin(theta) #Initial vertical and horizontal speeds
t = 0.0 #Starting time
x = 0.0
y = 0.0
# =============================================================================


# ITERATIVE ALGORITHM USING EULER'S METHOD FOR MOTION WITH DRAG FORCE
# =============================================================================
while y >= 0: #Follow the ball while it hasn't gone below the y position of its initial position
     xa_1.append(x)		     # add x to the x array
     ya_1.append(y)          # add y to the y array

     
     # Use Euler's algorithm
     y = y + vy * dt        
     x = x + vx * dt
     vy = vy + a_y1 * dt
     vx = vx + a_x1 * dt
     t = t + dt #Step up the time
     if y > Max_Height_1: #Update the value of the Maximum Height whenever a larger value of y is found
          Max_Height_1 = y 
# =============================================================================
xa_1.append(x)		    # add x to the x array
ya_1.append(y)          # add y to the y array


# PRINT EACH ITERATION VALUE FOR X AXIS AND Y AXIS
# =============================================================================
for num in range(len(xa_1)):
    print("Iteration {} X-axis value is: {:.3f}".format(num, xa_1[num]))
    
for num in range(len(ya_1)):
    print("Iteration {} Y-axis value is: {:.3f}".format(num, ya_1[num]))

print("\n")    
print("Total Iteration Number is: {}".format(len(xa_1)))
print("\n")        
# =============================================================================


# RE-CONFIG
# =============================================================================
vx,vy = v*cos(theta), v*sin(theta) #Initial vertical and horizontal speeds
t = 0.0 #Starting time
x = 0.0
y = 0.0
# =============================================================================


# ITERATIVE ALGORITHM USING EULER'S METHOD FOR MOTION WITHOUT DRAG FORCE
# =============================================================================
while y >= 0: #Follow the ball while it hasn't gone below the y position of its initial position
     xa_2.append(x)		     # add x to the x array
     ya_2.append(y)          # add y to the y array
     
     # Since only velocity can change by time, we do not need to find acceleration for (dt/2) in case of w/o drag force
     vx_2 = vx + (a_x0*(dt/2))
     vy_2 = vy + (a_y0*(dt/2))


     # Use Euler's algorithm
     y = y + vy_2 * dt        
     x = x + vx_2 * dt
     vy = vy + a_y0 * dt
     vx = vx + a_x0 * dt
     t = t + dt #Step up the time
     if y > Max_Height_0: #Update the value of the Maximum Height whenever a larger value of y is found
          Max_Height_0 = y 
# =============================================================================
xa_2.append(x)		    # add x to the x array
ya_2.append(y)          # add y to the y array


# PRINT EACH ITERATION VALUE FOR X AXIS AND Y AXIS
# =============================================================================
for num in range(len(xa_2)):
    print("Iteration {} X-axis value is: {:.3f}".format(num, xa_2[num]))
    
for num in range(len(ya_2)):
    print("Iteration {} Y-axis value is: {:.3f}".format(num, ya_2[num]))

print("\n")    
print("Total Iteration Number is: {}".format(len(xa_2)))
print("\n")      
print ("Total flight time:%.3f seconds Range of projectile:%.3f meters Maximum height is:%.3f meters" %(t,x,Max_Height_0))  
# =============================================================================


# RE-CONFIG
# =============================================================================
vx,vy = v*cos(theta), v*sin(theta) #Initial vertical and horizontal speeds
t = 0.0 #Starting time
x = 0.0
y = 0.0
# =============================================================================


# ITERATIVE ALGORITHM USING EULER'S METHOD FOR MOTION WITH DRAG FORCE
# =============================================================================
while y >= 0: #Follow the ball while it hasn't gone below the y position of its initial position
     xa_3.append(x)		     # add x to the x array
     ya_3.append(y)          # add y to the y array

     
     # Since only velocity can change by time, we do not need to find acceleration for (dt/2) in case of w/o drag force
     vx_2 = vx + (a_x1*(dt/2))
     vy_2 = vy + (a_y1*(dt/2))


     # Use Euler's algorithm
     y = y + vy_2 * dt        
     x = x + vx_2 * dt
     vy = vy + a_y1 * dt
     vx = vx + a_x1 * dt
     t = t + dt #Step up the time
     if y > Max_Height_1: #Update the value of the Maximum Height whenever a larger value of y is found
          Max_Height_1 = y 
# =============================================================================
xa_3.append(x)		    # add x to the x array
ya_3.append(y)          # add y to the y array


# PRINT EACH ITERATION VALUE FOR X AXIS AND Y AXIS
# =============================================================================
for num in range(len(xa_3)):
    print("Iteration {} X-axis value is: {:.3f}".format(num, xa_3[num]))
    
for num in range(len(ya_3)):
    print("Iteration {} Y-axis value is: {:.3f}".format(num, ya_3[num]))

print("\n")    
print("Total Iteration Number is: {}".format(len(xa_3)))
print("\n")        
# =============================================================================


# PRINT FLIGHT TIME, RANGE OF PROJECTION AND MAX HEIGHT OF MOVING OBJECT
print ("Total flight time:%.3f seconds Range of projectile:%.3f meters Maximum height is:%.3f meters" %(t,x,Max_Height_1))


# PLOT TRAJECTORY MOVING OBJECT
# =============================================================================
plt.figure()
plt.plot(xa_0,ya_0, label = "W/o Drag Force Euler")
plt.plot(xa_1,ya_1, label = "W/ Drag Force Euler")
plt.plot(xa_2,ya_2, label = "W/ Drag Force Improved Euler")
plt.plot(xa_3,ya_3, label = "W/ Drag Force Improved Euler")
plt.ylim(0,Max_Height_0+Max_Height_0/10)
plt.ylabel('Horizontal Axis (m)')
plt.xlabel('Vertical Axis (m)')
plt.title('Trajectory Motion of Object')
plt.legend()
plt.show()
# =============================================================================