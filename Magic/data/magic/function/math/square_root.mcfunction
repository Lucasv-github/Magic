################################################################################
#Purpose: Computer the square root of the input value
#Arguments: Input: Temp reg_1
#Runner: Doesn't matter
#Return values: Temp reg_1
#Authors: Lprogrammer
################################################################################

scoreboard players set Temp reg_2 1
function magic:math/square_root_loop

scoreboard players remove Temp reg_2 2
scoreboard players operation Temp reg_1 = Temp reg_2