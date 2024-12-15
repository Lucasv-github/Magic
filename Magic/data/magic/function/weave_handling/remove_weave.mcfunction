#This function should be run as the weave to be removed

#say remove weave

#The player remove weave will handle remove cleanup
#Will remove from player holding as well

scoreboard players operation Temp reg_1 = @s weave_owner_entity_id
scoreboard players operation Temp reg_2 = @s player_weave_index

execute as @s store result storage magic:remove_weave_index index int 1 run scoreboard players get Temp reg_2
execute as @s as @e[tag=using,tag=can_use] if score @s entity_id = Temp reg_1 run tag @s add remove_weave_temp_worked
execute as @s as @e[tag=using,tag=can_use] if score @s entity_id = Temp reg_1 run function magic:weave_handling/player_remove_weave with storage magic:remove_weave_index

#Fallback if player is not online
execute unless entity @e[tag=remove_weave_temp_worked] run function magic:cleanup/remove_cleanup

tag @e remove remove_weave_temp_worked
