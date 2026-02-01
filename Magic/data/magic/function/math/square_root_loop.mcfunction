################################################################################
#Purpose: Check if Temp reg_2^2 <= Temp reg_1, if so add to Temp reg_2 and run itself 
#Runner: Doesn't matter, ran via math/square_root.mcfunction and itself
#Return values: Temp reg_1
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_3 = Temp reg_2
scoreboard players operation Temp reg_3 *= Temp reg_2

scoreboard players add Temp reg_2 1
execute if score Temp reg_3 <= Temp reg_1 run function magic:math/square_root_loop