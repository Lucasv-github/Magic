scoreboard players operation Temp reg_1 = @s player_id

#Damage player for every incorrect attached
execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held,tag=!hold_used,tag=held_executed_once] if score @s player_id = Temp reg_1 as @a if score @s player_id = Temp reg_1 run damage @s 8 minecraft:magic
execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held,tag=!hold_used,tag=held_executed_once] if score @s player_id = Temp reg_1 as @a if score @s player_id = Temp reg_1 run effect give @s nausea 5

#Remove all held correctly
execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held,tag=!hold_used] if score @s player_id = Temp reg_1 run tag @s add temp_clear_correct
execute as @e[tag=temp_clear_correct] run function magic:remove_cleanup

#Not actie gets removed
execute as @e[tag=temp_clear_correct] on passengers run kill @s
kill @e[tag=temp_clear_correct]

#Remove flying snowballs
execute as @e[type=minecraft:snowball,tag=ray] if score @s player_id = Temp reg_1 on vehicle run kill @s
execute as @e[type=minecraft:snowball,tag=ray] if score @s player_id = Temp reg_1 run kill @s