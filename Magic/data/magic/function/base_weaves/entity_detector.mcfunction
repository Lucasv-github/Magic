scoreboard players set @s reg_1 1

#Need to have detection as 0 to make weave easier as it blocks with 1 already set, and only allows with zero set from here
execute at @s if entity @e[distance=..5,type=!player,tag=!target_point] run scoreboard players set @s reg_1 0

execute at @s run scoreboard players operation @s[scores={reg_1=0}] weave_locked_player_id = @a[limit=1, sort=nearest, distance=..5] player_id
execute at @s run scoreboard players operation @s[scores={reg_1=0}] weave_locked_entity_id = @e[limit=1, sort=nearest, distance=..5,tag=!target_point] entity_id

scoreboard players set @s[scores={reg_1=1}] weave_read_index 0

tag @s add weave_ward