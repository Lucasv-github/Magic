#Input in Temp reg_1, output in same

scoreboard players set Temp reg_2 1
function magic:math/square_root_loop

scoreboard players remove Temp reg_2 2
scoreboard players operation Temp reg_1 = Temp reg_2