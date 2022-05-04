1997 / QuickBasic
# MasterMind
<br />
I love games where I have to think and one of the games is mastermind (although you can solve it with simple logic).<br />
In February 1997 I made that game in QuickBasic where you can change the number of rows (attempts), columns and colors. You can change if you want information about <i>right color in right place</i> and <i>right color in wrong place</i>.<br />
I also added <i>show which color</i> and <i>show which column</i> but I never got to use it so there was never any code for those parts.<br />
<br />
But this many years later, I see that I made smart and structured solutions like settings are in an array and menu indexes are used to read and write to the settings which results in less code.<br />
That the game is divided into sections that calculate or draw different things.<br />
The game is written with a lot of Goto and GoSub which many people look at with an evil eye today, but don't forget that this was 1997.<br />
<br />

### How to Install it (if you whant to use the code):
Install QB64 (https://github.com/QB64Team/qb64/releases).<br />
1) download QB64 (QuickBasic for 64 bit system).
2) put it in a folder without spaces (ok: "c:\qb64quickbasicforwindows10", error: "c:\qb 64 quick basic for windows 10".
3) download the this repository (files) and copy/move the *MasterMind.bas* to the same folder as QB64.
4) or copy the code and past it in a file and name it *MasterMind.bas* in the same folder as QB64.
5) run qb64 and open the <i>MasterMind.bas</i>.
<br />

### How to run it (with code):
1) make sure you have installed and run QB64 in a folder without spaces and have loaded <i>MasterMind.bas</i> (see How to Install it above).
2) press the F5 key on the keyboard and it will make an exe file in the same folder and run the code.
<br />

### How to Play:
You play against the computer.<br />
The computer selects 4 colors and you should try to figure out which colors and in which order the computer has selected.<br />
For each correct color in the correct place, you get a green X.<br />
For each correct color in the wrong place, you get a red X.<br />
<br />

![MasterMind - Main Menu](/Screenshots/MasterMind_MainMenu.png)
Main Menu:<br />
Use the arrow keys and the space bar to navigate.<br />
<br />

![MasterMind - Level Menu](/Screenshots/MasterMind_LevelMenu.png)
Level Menu:<br />
Use the arrow keys and the space bar to navigate.<br />
<i>Number of attempts</i> is how you many trials you get before Game Over.<br />
<i>Number of colors</i> is how meny colors you and the computer choose from (more colors = harder).<br />
<i>Number of columns</i> is how many "X" you must get right (more columns = harder).<br />
<br />

![MasterMind - Option Menu](/Screenshots/MasterMind_OptionMenu.png)
Option Menu:<br />
Use the arrow keys and the space bar to navigate.<br />
<i>The right color in the wrong place</i> For each correct color in the wrong place, you get a red X.<br />
<i>Reveal which color is right</i> NOT IN USE!<br />
<i>The right color in the right place</i> For each correct color in the correct place, you get a green X.<br />
<i>Reveal which column is right</i> NOT IN USE!<br />
<br />

![MasterMind - Playing](/Screenshots/MasterMind_Playing.png)
The Game Board:<br />
Use right and left arrow keys to change column and up and down arrow keys to change color and space bar to guess and esc key to go back to main menu.<br />
In the middle is a attempt counter.<br />
To the left of the attempt counter are your guesses.<br />
To the right of the attempt counter is the computers answer to your guess (green or red X).
