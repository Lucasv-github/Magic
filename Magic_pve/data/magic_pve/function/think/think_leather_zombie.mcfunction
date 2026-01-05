function magic_pve:think/start_boilerplate

#Fireball distance>25
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=25..] run scoreboard players set @s build 333363333
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=25..] run tag @s add magic_pve_opponent
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=25..] run tag @s remove magic_pve_action_left

#Fireball lightning 10<distance<25
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=10..25] run scoreboard players set @s build 31313131
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=10..25] run tag @s add magic_pve_opponent
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=10..25] run tag @s remove magic_pve_action_left

#Slap distance<10
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=..10] run scoreboard players set @s build 116111111
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=..10] run tag @s add magic_pve_opponent
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=..10] run tag @s remove magic_pve_action_left

#Remove slap
scoreboard players operation Temp reg_1 = @s entity_id
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=built,distance=5..] as @e[tag=weave_slap,tag=actively_held] if score @s weave_owner_entity_id = Temp reg_1 run function magic:weave_handling/remove_weave



#Launch on enemy
execute on target run tag @s add magic_pve_target

execute at @s[tag=magic_pve_opponent,tag=magic_pve_action_left] anchored eyes positioned ^ ^ ^3 facing entity @e[limit=1,sort=nearest,tag=magic_pve_target] eyes run function magic:new_ray_multi_blocked
tag @s[tag=magic_pve_action_left] remove magic_pve_opponent

tag @e remove magic_pve_target

tag @s remove magic_pve_action_left
tag @s remove magic_pve_think_current_temp