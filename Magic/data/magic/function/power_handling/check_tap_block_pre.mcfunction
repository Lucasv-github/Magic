tag @s remove tap_blocked
scoreboard players set @s tap_block_percentage 0

tag @s[tag=external_tap_blocked] add tap_blocked

tag @s add check_tap_block_temp

#Resistance handling
scoreboard players operation Temp reg_1 = @s entity_id
execute as @e[tag=target_point,tag=actively_held,tag=weave_resistance] if score @s weave_locked_entity_id = Temp reg_1 run scoreboard players set @e[tag=check_tap_block_temp] tap_block_percentage 10
execute as @e[tag=target_point,tag=tied_off,tag=weave_resistance,scores={weave_remaining_time=1..}] if score @s weave_locked_entity_id = Temp reg_1 run scoreboard players set @e[tag=check_tap_block_temp] tap_block_percentage 10

execute at @s as @e[type=minecraft:armor_stand,tag=tap_blocker] run function magic:power_handling/check_tap_block

tag @s remove check_tap_block_temp