################################################################################
#Purpose: Check if a player has placed its 9:th slot weave
#Runner: A player who want to check if it has placed its 9:th slot weave
#Return values: @s reg_1 is set to 1 if the weave has been placed
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @s player_id
scoreboard players set Temp reg_2 0

#Handle mainhand
execute store result score Temp reg_2 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index

#Handle offhand (not ideal but least bloated way to do this) (the weave might be moved here before the check)
execute if score Temp reg_2 matches 0 run execute store result score Temp reg_2 run data get entity @s equipment.offhand.components.minecraft:custom_data.Player_weave_index

#Start with false
scoreboard players set Temp reg_3 0

#Set to true if found
execute as @e[tag=target_point,tag=actively_held] if score @s weave_owner_player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run scoreboard players set Temp reg_3 1
scoreboard players operation @s reg_1 = Temp reg_3