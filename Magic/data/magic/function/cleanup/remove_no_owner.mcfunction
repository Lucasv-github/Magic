#Observe that this is only run for non player placed weaves

scoreboard players operation Temp reg_1 = @s weave_owner_entity_id
execute as @e if score @s entity_id = Temp reg_1 run tag @s add remove_no_owner_exists_temp

execute unless entity @e[tag=remove_no_owner_exists_temp] run function magic:weave_handling/remove_weave

tag @e remove remove_no_owner_exists_temp