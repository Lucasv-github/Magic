scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_2 = @s player_weave_index

#Copy weave data
execute as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run tag @s add force_point

scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] stage = @s stage

scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] halve_amount_hold = @s halve_amount_hold
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] current_held = @s current_held

scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_1 = @s t_1
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_2 = @s t_2
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_3 = @s t_3
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_4 = @s t_4
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_5 = @s t_5
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_6 = @s t_6
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_7 = @s t_7
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_8 = @s t_8
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_9 = @s t_9
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_10 = @s t_10
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_11 = @s t_11
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_12 = @s t_12
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_13 = @s t_13
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_14 = @s t_14
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_15 = @s t_15
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_16 = @s t_16
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_17 = @s t_17
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_18 = @s t_18
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_19 = @s t_19
scoreboard players operation @e[type=minecraft:armor_stand, tag=force_point] t_20 = @s t_20

tag @e[type=minecraft:armor_stand] remove force_point