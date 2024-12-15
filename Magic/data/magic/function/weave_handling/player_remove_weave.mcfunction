#This function should be run as the player

#say player remove weave

#Need to remove ALL with same weave_index
scoreboard players operation Temp reg_1 = @s entity_id
$execute as @e[tag=target_point] if score @s weave_owner_entity_id = Temp reg_1 if score @s player_weave_index matches $(index) run tag @s add player_remove_weave_exists_temp

execute as @e[tag=player_remove_weave_exists_temp] run function magic:cleanup/remove_cleanup

#Fallback if none found

$execute unless entity @e[tag=player_remove_weave_exists_temp] run data modify storage magic:remove_weave_data index set value $(index)
execute unless entity @e[tag=player_remove_weave_exists_temp] run function magic:cleanup/remove_weave_data with storage magic:remove_weave_data

tag @e remove player_remove_weave_exists_temp

#$say $(index)
$clear @s minecraft:carrot_on_a_stick[custom_data~{Player_weave_index:$(index)}]

#To make it work on entities as well
$execute if score @s player_weave_index matches $(index) run tag @s remove built
$execute if score @s player_weave_index matches $(index) run function magic:weave_handling/new_weave


