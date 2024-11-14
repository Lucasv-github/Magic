#Runs when changing weave in slot 9
execute store result score @s player_weave_index run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.Player_weave_index

execute store result storage magic:get_weave_length index int 1 run scoreboard players get @s player_weave_index
function magic:weave_processing/get_weave_length with storage magic:get_weave_length
scoreboard players operation @s weave_length = Temp reg_1