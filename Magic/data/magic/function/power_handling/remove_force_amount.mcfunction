################################################################################
#Purpose: Decrease current_held from @s by Remove_force reg_1 and exit if needed
#Argument Remove_force reg_1: force_to_remove
#Runner: An entity whose current_held should be decreased
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation @s current_held -= Remove_force reg_1
execute as @s[scores={current_held=..0}] run function magic:power_handling/exit