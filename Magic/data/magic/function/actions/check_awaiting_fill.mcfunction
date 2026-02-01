################################################################################
#Purpose: Check if we can finalize a block fill, by making sure no other plugin has blocked explosions within the fill area
#Runner: Armorstands one tick after the fill was first proposed
#Return values:
#Authors: Lprogrammer
################################################################################

tag @s add can_fill_temp

scoreboard players operation Temp reg_1 = @s entity_id

execute as @e[type=minecraft:armor_stand,tag=fill_allowed_checker] if score @s safe_fill_creator_entity_id = Temp reg_1 run tag @e remove can_fill_temp

#execute as @s[tag=can_fill_temp] run say finalize fill
execute as @s[tag=can_fill_temp] run function magic:actions/finalize_safe_fill

#execute as @s[tag=!can_fill_temp] run say illegal fill

execute as @s[tag=!can_fill_temp] store result storage magic:remove_fill_data entity_id int 1 run scoreboard players get @s entity_id
execute as @s[tag=!can_fill_temp] run function magic:actions/remove_fill_data with storage magic:remove_fill_data
execute as @s[tag=!can_fill_temp] run data remove storage magic:remove_fill_data entity_id 

tag @s remove can_fill_temp
tag @s remove awaiting_fill

scoreboard players operation Temp reg_1 = @s entity_id
execute as @e[type=minecraft:armor_stand,tag=fill_allowed_checker] if score @s safe_fill_creator_entity_id = Temp reg_1 run kill @s

