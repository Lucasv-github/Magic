################################################################################
#Purpose: Remove a weave whose corresponding item was dropped
#Runner: The item that represents the weave that was dropped
#Return values:
#Authors: Lprogrammer
################################################################################

#Using entity id here to make it work if a PVE mob somehow drops their weave
scoreboard players set Temp reg_2 0
execute at @s run scoreboard players operation Temp reg_2 = @n[tag=using,distance=..2] entity_id

execute store result score Temp reg_3 run data get entity @s Item.components.minecraft:custom_data.Player_weave_index

execute as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s weave_owner_entity_id = Temp reg_2 if score @s player_weave_index = Temp reg_3 run tag @s add remove_cleanup_player_single_temp

#Handling if the weave is placed
execute store result storage magic:get_weave_length index int 1 run scoreboard players get Temp reg_3
function magic:weave_processing/get_weave_length with storage magic:get_weave_length

data remove storage magic:get_weave_length index

scoreboard players operation Temp reg_1 *= 10 reg_1
execute as @a[tag=using] if score @s entity_id = Temp reg_2 run scoreboard players operation @s current_drain -= Temp reg_1
execute as @a[tag=using] if score @s entity_id = Temp reg_2 run scoreboard players remove @s weave_count 1

execute as @e[tag=remove_cleanup_player_single_temp] run function magic:cleanup/remove_cleanup


#Fallback if none placed existed
execute unless entity @e[tag=remove_cleanup_player_single_temp] store result storage magic:remove_weave_data index int 1 run data get entity @s Item.components.minecraft:custom_data.Player_weave_index
execute unless entity @e[tag=remove_cleanup_player_single_temp] run function magic:cleanup/remove_weave_data with storage magic:remove_weave_data

tag @e remove remove_cleanup_player_single_temp

kill @s