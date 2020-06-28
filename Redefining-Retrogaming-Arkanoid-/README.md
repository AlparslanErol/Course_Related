# Redefining-Retrogaming-Arkanoid-
In this project, our goal was to develop the vintage game “Arkanoid”, with primitive specs, in VHDL and implement it on Xilinx Spartan6 FPGA.

# 1)	 INTRODUCTION

Almost everybody of the 90’s generation and older is familiar with the Arkanoid game. It was very positively recepted by various critics and became the one of the best four games of 1986, along with “Bobble Bobble”, “Fantasy Zone” and “Rygar”. Clare Edgeley, British video-game journalist and editor, described Arkanoid as “a lovely game” that is “fast, colourful, simple and addictive”.

In our final project, we aimed to revive this vintage game culture with our favorite vintage game Arkanoid. We harnessed what we learned throughout the semester and also, researched the solutions of the problems we come along during the coding and implementation and provide our own answers. Also, with partnership, we benefited from our strenghts and collaborated effectively to turn our idea into realization. 

All in all, this final project not only lead to strenghten our skills in digital design and teamwork but also it gave us the joy of realizing the idea into the real life, or call it simply, “engineering”.




# 2)	PROBLEM STATEMENT 

In this project, our goal was to develop the vintage game “Arkanoid”, with primitive specs, in VHDL and implement it on Spartan6 FPGA. 


# 3)	RELATED BACKGROUND

How to Play Arkanoid: The Gameplay
Arkanoid begins with three rows of bricks, with each row having three columns. The color of the bricks is red. Using a single ball, the player must knock down as many bricks as possible by using the walls and/or the paddle below to ricochet the ball against the bricks and eliminate them. If the player's paddle misses the ball's rebound, he or she will lose the game. 


# 4)	DESIGN

In overall, the design contains 4 VHDL modules:
## 1-	Clock Division
## 2-	User Input
## 3-	Ball Consequences
## 4-	Drawing

These modules are explained in detail below:

a)	“constants” Package 
There are common constant values, e.g. for specifying various features of the field, ball and blocks, that are used in each VHDL module and thus we decided to encapsulate all of them in a package. In each module, we use that package with a “use” command at the top of the code. Thus, with that, we not only save a great deal of time but also developed a good, maintainable coding design, which is one of our great interests in this project.

b)	Frequency Division
In this module, we divided the 100 MHz system clock to 25 MHz, in order to generate clock cycles for the screen sync. Also, we aimed to divide the clock for the paddle and ball, as well. However, we failed to achieve this since we were receiving an error where we fail to debug. Nevertheless, we found a solution to this problem by obtaining these clocks “in a different way”. These 1 KHz and 200 Hz in order to generate clock cycles for the screen syncs, paddle and ball, respectively. Thus, the paddle will move five times faster than the ball.
c)	Handling User Input
The user will horizontally move the paddle on the lower end of the screen and this is handled by the BTNL and BTNR buttons on the FPGA. 
d)	Determining Ball Consequences
Collision Detection
## i)	Collision With Paddle
We achieved this by comparing the coordinates of ball with the paddle’s. First, the code compares the y component of the ball, if it enters, then, checks for the paddle’s x. 

We decided to have a different bouncing mechanisms for different parts of the paddle, as illustrated in figure-1:
	
Section 1: “As they have come, so they will go”(3) No change in x velocity of the ball.
Section 2: x velocity of the ball will be +2 if the ball is coming from left and  -2, if right.
Section 3: x velocity will be +3 if the ball is coming from left and -2, if right.

## ii)	Collision With Blocks
There are two checks for this collision. First, the code determines whether the ball is in the vicinity of the 3x3 blocks. Then, with a nested for loop circulating through the each block, the code checks whether or not the ball hits the block. If it does, the code signs it with a ‘0’ and it will not be printed on the ‘drawing.vhd’

## iii)	Collision With Edges
If the ball hits the edges then it will bounce back unless it’s the lower corner. If it hits the lower corner, then game_over will be ‘1’ and the game ends.
	


e)	Drawing To The Screen
i)	Field
The field is drawn as 0,0,0 i.e black with an ‘if’ checking the edges. On edges it will print red lines.
ii)	Blocks
We researched online and found out the usage of matrix type. We defined it on the ‘constants’ library and drew to the screen with a nested for loop.
iii)	Paddle
We reserved some row range on the lower end of the screen. When the rowcount hits that row range, we draw the paddle comparing its current x position with columncount.
iv)	Ball
We detect the ball by comparing its x and y component with row and column count. We wrote several ifs with 1 pixel differences from 1 to 5, to give it a round shape. 

f)	Pin Assingment
We assign BTNL for left, BTNR for right, BTNCenter for reset for user control. Also, syncs and rgb colors were assigned. 

# 5)	RESULTS

Coding these modules and fixing several bugs during the process, which was extremely frustrating, we found out that we had come a long way. After having completed the design, we concluded our work in an overall module and generated the programming file. 

We tested our design with a passion and enthusaism; however, it was not very successful at the first several attempts. Despite that fact, we didn’t give in and debug, searched online where we come along with problems, get ideas and in the end, apply to our design. Hopefully, we solved our problems and we felt very happy when we see our design actually functions!

We get addicted to “our” game, already, let’s see if you will be, too !         


# 6)	CONCLUSION

Developing the retro game Arkanoid has been a huge opportunity and pleasure for us, who are both the atari addicts and vintage enthusiasts. Designing such a game was a huge step forward from the labs and to be honest, at the beginning there were much we were yet to know. However, thanks to our creative thinking capabilities and researching skills we quickly found solutions to our problems and applied in our design, thus, succeeded.

a)	Future Work
We gave meticulous attention to our coding style and designed a highly maintainable system since we, as retrogame enthusiasts, sincerely want it to be open for further developments. Here is a list of  few points where we are going to focus and develop:
(1)	The paddle will be capable of firing from the both ends. This addition will drop from eliminated blocks.
(2)	The level system will be implemented to the game and as the level increases, new hardships will be added, such as paddle width or ball speed. 
(3)	The LED on the FPGA will show the user info or scores etc. 
   We stronly desire to add these features and increase the game’s functionality. 

# 7)	REFERENCES

1-	https://www.nandland.com/vhdl/examples/example-array-type-vhdl.html

2-	https://stackoverflow.com/questions/17507224/rectangle-box-collision-in-vhdl

3-	https://en.wikipedia.org/wiki/Arkanoid


