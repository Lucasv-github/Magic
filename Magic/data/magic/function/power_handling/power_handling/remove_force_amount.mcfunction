#Remove Remove_force reg_1 force to player
scoreboard players operation @s current_held -= Remove_force reg_1
execute as @s[scores={current_held=..0}] run function magic:power_handling/exit