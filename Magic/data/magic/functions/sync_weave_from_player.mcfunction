#say sync weave from player

tag @s remove no_weave

scoreboard players operation Temp reg_1 = @s player_id

#This is guranteed to get the value
execute as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_1 store result score Temp reg_2 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index
scoreboard players operation @s player_weave_index = Temp reg_2

#This function could be largely copied out here. Not sure if that is cleaned though
function magic:set_weave_from_player