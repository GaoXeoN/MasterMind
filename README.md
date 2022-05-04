1997 / QuickBasic
# MasterMind

I love games where I have to think and one of the games is mastermind (although you can solve it with simple logic).
In February 1997 I made that game in QuickBasic where you can change the number of rows (attempts), columns and colors.
You can change if you want information about "right color in right place" and "right color in wrong place".
I also added "show which color" and "show which column" but I never got to use it so there was never any code for those parts.

But this many years later, I see that I made smart and structured solutions like settings are in an array and menu indexes are used to read and write to the settings which results in less code.
That the game is divided into sections that calculate or draw different things.
The game is written with a lot of Goto and GoSub which many people look at with an evil eye today, but don't forget that this was 1997.

### How to Install it (if you whant to use the code):

install QB64 (https://github.com/QB64Team/qb64/releases)
1) download QB64 (QuickBasic for 64 bit system)
2) put it in a folder without spaces (ok: "c:\qb64quickbasicforwindows10", error: "c:\qb 64 quick basic for windows 10"
3) download the this repository (files) and copy/move the *MasterMind.bas* to the same folder as QB64
4) or copy the code and past it in a file and name it *MasterMind.bas* in the same folder as QB64
5) run qb64 and open the *MasterMind.bas*

### How to run it (with code):
1) make sure you have installed and run QB64 in a folder without spaces and have loaded MasterMind.bas (see How to Install it above)
2) press the F5 key on the keyboard and it will make an exe file in the same folder and run the code

### How to Play:

You play against the computer.
The computer selects 4 colors and you should try to figure out which colors and in which order the computer has selected.
For each correct color in the correct place, you get a green X.
For each correct color in the wrong place, you get a red X.

Level Menu:
use the arrow keys and the space bar to navigate.
*Number of attempts* is how you many trials you get before Game Over.
*Number of colors* is how meny colors you and the computer choose from (more colors = harder).
*Number of columns* is how many "X" you must get right (more columns = harder).

Option Menu:
use the arrow keys and the space bar to navigate.
*The right color in the wrong place* For each correct color in the wrong place, you get a red X.
*Reveal which color is right* NOT IN USE
*The right color in the right place* For each correct color in the correct place, you get a green X.
*Reveal which column is right* NOT IN USE

The Game Board:
Use right and left arrow keys to change column and up and down arrow keys to change color and space bar to guess and esc key to go back to main menu.
In the middle is a attempt counter
To the left of the attempt counter are your guesses
To the right of the attempt counter is the computers answer to your guess (green or red X).
