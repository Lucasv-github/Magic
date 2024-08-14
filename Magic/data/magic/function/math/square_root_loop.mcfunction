#Mid = floor((low + high)/2)
scoreboard players operation Temp reg_4 = Temp reg_2
scoreboard players operation Temp reg_4 += Temp reg_3
scoreboard players operation Temp reg_4 /= 2 reg_1

scoreboard players operation Temp reg_5 = Temp reg_4
scoreboard players operation Temp reg_5 *= Temp reg_4

#If mid*mid < input?
#Low = mid+1
execute if score Temp reg_5 < Temp reg_1 run scoreboard players operation Temp reg_2 = Temp reg_4
execute if score Temp reg_5 < Temp reg_1 run scoreboard players add Temp reg_2 1

#Else if mid*mid=input
#We will return

#Else if mid*mid > input
#high = mid - 1
execute if score Temp reg_5 > Temp reg_1 run scoreboard players operation Temp reg_3 = Temp reg_4
execute if score Temp reg_5 > Temp reg_1 run scoreboard players remove Temp reg_3 1

#Low <= high and mid*mid!=input
execute if score Temp reg_2 <= Temp reg_3 unless score Temp reg_5 = Temp reg_1 run function magic:math/square_root_loop

#Else done, return high
execute unless score Temp reg_2 <= Temp reg_3 run scoreboard players operation Temp reg_1 = Temp reg_3
#Also return if mid*mid = input
execute if score Temp reg_5 = Temp reg_1 run scoreboard players operation Temp reg_1 = Temp reg_4
