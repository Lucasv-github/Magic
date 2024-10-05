scoreboard players operation Temp reg_3 = Temp reg_2
scoreboard players operation Temp reg_3 *= Temp reg_2

scoreboard players add Temp reg_2 1
execute if score Temp reg_3 <= Temp reg_1 run function magic:math/square_root_loop