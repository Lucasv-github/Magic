#Input in Temp reg_1, output in same

#TODO might want to handle negative
scoreboard players set Temp reg_2 1
function magic:math/cube_root_loop

scoreboard players remove Temp reg_2 2
scoreboard players operation Temp reg_1 = Temp reg_2