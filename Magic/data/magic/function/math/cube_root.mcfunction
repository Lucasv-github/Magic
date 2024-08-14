#Input in Temp reg_1, output in same

#TODO might want to handle negative, should only need to invert input and output

#Low
scoreboard players set Temp reg_2 0

#High
scoreboard players operation Temp reg_3 = Temp reg_1

#Low < high
execute if score Temp reg_2 < Temp reg_3 run function magic:math/cube_root_loop
