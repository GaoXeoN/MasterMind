rem made by GoaXeoN 1997
Cls
Dim LE(2, 3), OP(4), PL(4, 8)

Rem PL = player, 1 stores the values of the guesser, 2 stores the value of the hiden colors
PL(1, 1) = 0: PL(2, 1) = 0
PL(1, 2) = 0: PL(2, 2) = 0
PL(1, 3) = 0: PL(2, 3) = 0
PL(1, 4) = 0: PL(2, 4) = 0
PL(1, 5) = 0: PL(2, 5) = 0
PL(1, 6) = 0: PL(2, 6) = 0
PL(1, 7) = 0: PL(2, 7) = 0
PL(1, 8) = 0: PL(2, 8) = 0

Rem LE = level, 1,x = settings, 2,x = max values, x,1 = max attempts, x,2 numbers of colors, x,3 = numbers of columns
LE(1, 1) = 10: LE(2, 1) = 1000
LE(1, 2) = 6: LE(2, 2) = 8
LE(1, 3) = 4: LE(2, 3) = 8

Rem OP = option, 0=off/1=on, 1=right color wrong place, 2=reveal right color, 3=right color right place, 4=reveal right column
OP(1) = 1
OP(2) = 0
OP(3) = 1
OP(4) = 0

Rem ****************************** MAIN MENU
MAIN_MENU:
Cls: V1 = 1: Color 4
Locate 1, 18: Print "M A I N   M E N U   -   M A S T E R M I N D"
GoSub PRINT_MENU_FRAME
GoSub PRINT_MAIN_MENU
MAIN_MENU_2:
GoSub KEY_STROKE
If IN = 0 Then
    Rem move up and down on the menu
    If IN$ = "H" Then V1 = V1 - 1
    If V1 < 1 Then V1 = 4
    If IN$ = "P" Then V1 = V1 + 1
    If V1 > 4 Then V1 = 1
    GoSub PRINT_MAIN_MENU
End If
Rem jump in to other menus
If V1 = 1 And (IN = 13 Or IN$ = " ") Then GoTo START
If V1 = 2 And (IN = 13 Or IN$ = " " Or (IN = 0 And (IN$ = "K" Or IN$ = "M"))) Then GoTo LEVEL_MENU
If V1 = 3 And (IN = 13 Or IN$ = " " Or (IN = 0 And (IN$ = "K" Or IN$ = "M"))) Then GoTo OPTION_MENU
If V1 = 4 And (IN = 13 Or IN$ = " ") Then End
GoTo MAIN_MENU_2

Rem ******************************LEVEL MENU
LEVEL_MENU:
Cls: V2 = 1: Color 2
Locate 1, 35: Print "L E V E L"
GoSub PRINT_MENU_FRAME
GoSub PRINT_LEVEL_MENU
LEVEL_MENU_2:
GoSub KEY_STROKE
If V2 = 4 And (IN = 13 Or IN$ = " " Or (IN = 0 And (IN$ = "K" Or IN$ = "M"))) Then GoTo MAIN_MENU
If IN = 0 Then
    Rem move up and down on the menu
    If IN$ = "H" Then V2 = V2 - 1
    If V2 < 1 Then V2 = 4
    If IN$ = "P" Then V2 = V2 + 1
    If V2 > 4 Then V2 = 1
    If V2 = 4 Then GoSub PRINT_LEVEL_MENU: GoTo LEVEL_MENU_2
    Rem setting LE values
    If IN$ = "K" And LE(1, V2) > 1 Then LE(1, V2) = LE(1, V2) - 1
    If IN$ = "M" And LE(1, V2) < LE(2, V2) Then LE(1, V2) = LE(1, V2) + 1
End If
GoSub PRINT_LEVEL_MENU
GoTo LEVEL_MENU_2

Rem ****************************** OPTION MENU
OPTION_MENU:
Cls: V3 = 1: Color 3
Locate 1, 34: Print "O P T I O N"
GoSub PRINT_MENU_FRAME
GoSub PRINT_OPTION_MENU
OPTION_MENU_2:
GoSub KEY_STROKE
If V3 = 5 And (IN = 13 Or IN$ = " " Or (IN = 0 And (IN$ = "K" Or IN$ = "M"))) Then GoTo MAIN_MENU
If IN = 0 Then
    Rem move up and down on the menu
    If IN$ = "H" Then V3 = V3 - 1
    If V3 < 1 Then V3 = 5
    If IN$ = "P" Then V3 = V3 + 1
    If V3 > 5 Then V3 = 1
    If V3 = 5 Then GoSub PRINT_OPTION_MENU: GoTo OPTION_MENU_2
    Rem setting OP values
    If IN$ = "K" Then OP(V3) = 1
    If IN$ = "M" Then OP(V3) = 0
    If OP(1) = 0 Then OP(2) = 0
    If OP(3) = 0 Then OP(4) = 0
End If
GoSub PRINT_OPTION_MENU
GoTo OPTION_MENU_2

Rem ****************************** START
START:
GANG = 0
For X = 1 To LE(1, 3)
    Rem randomize the guesing colors
    Randomize Timer
    PL(2, X) = Int(Rnd * LE(1, 2)) + 1
    Rem set player to color 1
    PL(1, X) = 1
Next X
GoTo PLAY_THE_GAME


PLAY_THE_GAME:
Cls: V4 = 1: Color 3
Locate 1, 30: Print "G A M E   B O A R D"
Color 7
Rem print an empty frame
For X = 1 To 25
    GoSub PRINT_PLAY_FRAME
Next X
GoSub PRINT_PLAY
PLAY_THE_GAME_2:
GoSub KEY_STROKE
Rem check the guess
If IN$ = " " Then GoSub PLAY_CONTROL
If IN = 27 Then GoTo MAIN_MENU
If IN = 0 Then
    Rem move to right or left column
    If IN$ = "K" Then V4 = V4 - 1
    If V4 < 1 Then V4 = LE(1, 3)
    If IN$ = "M" Then V4 = V4 + 1
    If V4 > LE(1, 3) Then V4 = 1
    Rem change the color of the column
    If IN$ = "P" And PL(1, V4) > 1 Then PL(1, V4) = PL(1, V4) - 1
    If IN$ = "H" And PL(1, V4) < LE(1, 2) Then PL(1, V4) = PL(1, V4) + 1
End If
GoSub PRINT_PLAY
GoTo PLAY_THE_GAME_2


Rem read a key stroke to IN$ and the asci code in IN
KEY_STROKE:
IN$ = InKey$
If IN$ = "" Then GoTo KEY_STROKE
IN = Asc(IN$): If IN = 0 Then IN$ = Mid$(IN$, 2, 1)
Return


PRINT_MAIN_MENU:
If V1 = 1 Then Color 28 Else Color 4
Locate 13, 35: Print "S T A R T"
If V1 = 2 Then Color 28 Else Color 4
Locate 15, 35: Print "L E V E L"
If V1 = 3 Then Color 28 Else Color 4
Locate 17, 34: Print "O P T I O N"
If V1 = 4 Then Color 28 Else Color 4
Locate 19, 32: Print "E N D   G A M E"
Color 7
Return

PRINT_LEVEL_MENU:
If V2 = 1 Then Color 26 Else Color 2
Locate 6, 22: Print "N U M B E R   O F   A T T E M P T S"
Color 15: Locate 7, 38: Print LE(1, 1)
  
If V2 = 2 Then Color 26 Else Color 2
Locate 9, 24: Print "N U M B E R   O F   C O L O R S"
For X = 1 To 8: If X < LE(1, 2) + 1 Then Color X + 7 Else Color 0
Locate 10, 25 + (3 * X): Print "X": Next X
  
If V2 = 3 Then Color 26 Else Color 2
Locate 12, 23: Print "N U M B E R   O F   C O L U M N S"
For X = 1 To 8: If X < LE(1, 3) + 1 Then Color 15 Else Color 0
Locate 13, 25 + (3 * X): Print "X": Next X
  
If V2 = 4 Then Color 26 Else Color 2
Locate 15, 34: Print "R E T U R N"
Return

PRINT_OPTION_MENU:
If V3 = 1 Then Color 27 Else Color 3
Locate 6, 16: Print "THE RIGHT COLOR IN THE WRONG PLACE    -"
If V3 = 2 Then Color 27 Else Color 3
Locate 9, 16: Print "REVEAL WHICH COLOR IS RIGHT           -"
If V3 = 3 Then Color 27 Else Color 3
Locate 12, 16: Print "THE RIGHT COLOR IN THE RIGHT PLACE    -"
If V3 = 4 Then Color 27 Else Color 3
Locate 15, 16: Print "REVEAL WHICH COLUMN IS RIGHT          -"
If V3 = 5 Then Color 27 Else Color 3
Locate 18, 34: Print "R E T U R N"
Color 15
Locate 6, 58
If OP(1) = 0 Then Print "off" Else Print "ON "
Locate 9, 58
If OP(2) = 0 Then Print "off" Else Print "ON "
Locate 12, 58
If OP(3) = 0 Then Print "off" Else Print "ON "
Locate 15, 58
If OP(4) = 0 Then Print "off" Else Print "ON "
Return

Rem print one line when playing
PRINT_PLAY:
Locate 22, 39: Color 7: Print GANG + 1
For X = 1 To LE(1, 3)
    If V4 = X Then Color PL(1, X) + 23 Else Color PL(1, X) + 7
    Locate 22, 9 + (3 * X): Print "X"
Next X
Return

Rem control game logic
PLAY_CONTROL:
V3 = V4: V4 = 0: GoSub PRINT_PLAY: V4 = V3
GANG = GANG + 1: RR = 0: RF = 0

Rem loop through all columns and zero check sums
For X = 1 To LE(1, 3)
    PL(3, X) = 0: PL(4, X) = 0
Next X
  
Rem loop through all columns and check if its right color on right place
For X = 1 To LE(1, 3)
    If PL(1, X) = PL(2, X) Then PL(3, X) = X: PL(4, X) = X: RR = RR + 1
Next X
  
Rem loop through all columns and check if its right color on wrong place
For X = 1 To LE(1, 3)
    For Y = 1 To LE(1, 3)
        If X <> Y And PL(3, X) = 0 And PL(4, Y) = 0 And PL(1, X) = PL(2, Y) Then PL(3, X) = Y: PL(4, Y) = X: RF = RF + 1
Next Y: Next X

Rem check if player win, lose or play more
If RR = LE(1, 3) Then GoTo GAME_OVER_WIN
If GANG = LE(1, 1) Then GoTo GAME_OVER_LOSE

Rem print out all right colors in right place
If OP(3) = 1 And RR > 0 Then
    For X = 1 To RR
        Locate 22, 45 + (3 * X): Color 2: Print "X"
    Next X
End If

Rem print out all right color in wrong place
If OP(1) = 1 And RF > 0 Then
    For X = 1 To RF
        Locate 22, 45 + (3 * RR) + (3 * X): Color 4: Print "X"
    Next X
End If
Locate 24, 1: Color 7: GoSub PRINT_PLAY_FRAME
Return




GAME_OVER_WIN:
Cls: Color 13
Locate 12, 9: Print "         Y   O   U       M   A   D   E       I   T   !"
GAME_OVER_WIN_2:
GoSub KEY_STROKE
If IN$ = " " Then GoTo MAIN_MENU
GoTo GAME_OVER_WIN_2

GAME_OVER_LOSE:
Cls: Color 14
Locate 12, 9: Print "            G   A   M   E       O   V   E   R   !"
GAME_OVER_LOSE_2:
GoSub KEY_STROKE
If IN$ = " " Then GoTo MAIN_MENU
GoTo GAME_OVER_LOSE_2




PRINT_MENU_FRAME:
Locate 2, 1
Print "********************************************************************************"
Print "********************************************************************************"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********                                                                ********"
Print "********************************************************************************"
Print "********************************************************************************"
Return

PRINT_PLAY_FRAME:
Print "*****                                                                      *****"
Return

