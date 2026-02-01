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