################################################################################
#Purpose: Get total drain: current_drain + Sum of all actively held weave's current_drain
#This allows weaves to drain an arbitrary amount
#Runner: The entity whose drain should be gotten
#Return values: Temp reg_1: 
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @s current_drain
scoreboard players operation Temp reg_2 = @s player_id
execute as @e[type=minecraft:armor_stand,tag=actively_held] if score @s weave_owner_player_id = Temp reg_2 run scoreboard players operation Temp reg_1 += @s current_drain

