################################################################################
#Purpose: Set player_weave_index to newly selected weave and update weave_length
#Runner: A player changing their 9:th slot weave, run via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute store result score @s player_weave_index run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.Player_weave_index

execute store result storage magic:get_weave_length index int 1 run scoreboard players get @s player_weave_index
function magic:weave_processing/get_weave_length with storage magic:get_weave_length

data remove storage magic:get_weave_length index

scoreboard players operation @s weave_length = Temp reg_1