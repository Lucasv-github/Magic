################################################################################
#Purpose: Remove a placed weave and everything belonging to it
#Runner: A weave to be removed
#Return values:
#Authors: Lprogrammer
################################################################################

#The player remove weave will only handle player item removal
scoreboard players operation Temp reg_1 = @s weave_owner_player_id
scoreboard players operation Temp reg_2 = @s player_weave_index

execute as @s store result storage magic:remove_weave_index index int 1 run scoreboard players get Temp reg_2
execute as @s as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run function magic:weave_handling/player_remove_weave with storage magic:remove_weave_index

#Nonplayer patch
scoreboard players operation Temp reg_1 = @s weave_owner_entity_id
execute as @s as @e[type=!player,tag=using] if score @s entity_id = Temp reg_1 run function magic:weave_handling/weave_moved_out

data remove storage magic:remove_weave_index index

function magic:cleanup/remove_cleanup
