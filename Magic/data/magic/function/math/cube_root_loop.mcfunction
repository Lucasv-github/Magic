#Mid = floor((low + high + 1)/2)
scoreboard players operation Temp reg_4 = Temp reg_2
scoreboard players operation Temp reg_4 += Temp reg_3
scoreboard players add Temp reg_4 1
scoreboard players operation Temp reg_4 /= 2 reg_1

scoreboard players operation Temp reg_5 = Temp reg_4
scoreboard players operation Temp reg_5 *= Temp reg_4
scoreboard players operation Temp reg_5 *= Temp reg_4

#If mid*mid*mid <= input?
#Low = mid
execute if score Temp reg_5 <= Temp reg_1 run scoreboard players operation Temp reg_2 = Temp reg_4

#Else high = mid - 1
execute unless score Temp reg_5 <= Temp reg_1 run scoreboard players operation Temp reg_3 = Temp reg_4
execute unless score Temp reg_5 <= Temp reg_1 run scoreboard players remove Temp reg_3 1

#Low < high
execute if score Temp reg_2 < Temp reg_3 run function magic:math/cube_root_loop

#Else done, return low
execute unless score Temp reg_2 < Temp reg_3 run scoreboard players operation Temp reg_1 = Temp reg_2