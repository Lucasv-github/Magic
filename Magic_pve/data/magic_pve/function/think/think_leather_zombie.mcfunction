#Start of boilerplate

tag @s add magic_pve_think_current_temp

tag @s add magic_pve_action_left


scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 /= 20 reg_1

execute as @s[tag=using] if score @s current_held < @s cumulative_halve_amount_hold run scoreboard players operation @s current_held += @s reg_1
execute as @s[tag=using] if score @s current_held > @s cumulative_halve_amount_hold run scoreboard players operation @s current_held = @s cumulative_halve_amount_hold

scoreboard players set @s reg_1 0
execute on target as @e[tag=magic_pve_think_current_temp] run scoreboard players set @s reg_1 1

execute as @s[scores={reg_1=1},tag=!using,tag=magic_pve_action_left] run tag @s add magic_pve_open
execute as @s[scores={reg_1=0},tag=using] run tag @s add magic_pve_exit

execute as @s[tag=magic_pve_open] run function magic:power_handling/open
tag @s[tag=magic_pve_open] remove magic_pve_action_left
tag @s remove magic_pve_open

execute as @s[tag=magic_pve_exit] run function magic:power_handling/exit
tag @s[tag=magic_pve_exit] remove magic_pve_action_left
tag @s remove magic_pve_exit

#End of boilerplate


#Lightning
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=5..] run scoreboard players set @s build 31
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=5..] run tag @s add magic_pve_opponent
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=5..] run tag @s remove magic_pve_action_left

#Launch on enemy
execute on target run tag @s add magic_pve_target

execute as @s[tag=magic_pve_opponent,tag=magic_pve_action_left] as @e[tag=magic_pve_target] run say target
execute at @s[tag=magic_pve_opponent,tag=magic_pve_action_left] anchored eyes positioned ^ ^ ^3 facing entity @e[limit=1,sort=nearest,tag=magic_pve_target] feet run function magic:new_ray_multi_blocked
tag @s[tag=magic_pve_action_left] remove magic_pve_opponent

tag @e remove magic_pve_target

tag @s remove magic_pve_action_left
tag @s remove magic_pve_think_current_temp