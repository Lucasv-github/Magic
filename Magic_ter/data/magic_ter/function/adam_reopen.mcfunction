################################################################################
#Purpose: forces collared player to enter circle with @s 
#Runner: player using the adam bracelet item
#Return values:
#Authors: Boblegrob & Lprogrammer
################################################################################

scoreboard players set @s click 0

tag @s add force_circle_owner_temp

execute store result score Temp reg_1 run data get entity @s SelectedItem.components.minecraft:custom_data.player_id

execute as @e[tag=can_use,tag=damane] if score @s player_id = Temp reg_1 run function magic:power_handling/force_circle

tag @s remove force_circle_owner_temp

execute as @s[tag=!circle_owner] run function magic_ter:adam_restore 