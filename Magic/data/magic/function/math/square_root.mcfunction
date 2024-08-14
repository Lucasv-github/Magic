#Input in Temp reg_1, output in same

#Low
scoreboard players set Temp reg_2 1

#High
scoreboard players operation Temp reg_3 = Temp reg_1

#High set to input divided by 2 if above 1
execute if score Temp reg_3 matches 2.. run scoreboard players operation Temp reg_3 /= 2 reg_1

#Low <= high
execute if score Temp reg_2 <= Temp reg_3 run function magic:math/square_root_loop
