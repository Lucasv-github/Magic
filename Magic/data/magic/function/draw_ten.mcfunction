tag @s add possible_to_draw

#If circled prevent more than x2
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold

execute as @s[tag=circle_owner] if score @s current_held > @s reg_1 run tag @s remove possible_to_draw
execute as @s[tag=angrealed] if score @s current_held > @s reg_1 run tag @s remove possible_to_draw
execute as @s[scores={progressive_shielded=1..}] if score @s current_held > @s reg_1 run tag @s remove possible_to_draw
execute as @s[scores={halve_amount_hold=..50}] if score @s current_held > @s reg_1 run tag @s remove possible_to_draw

execute at @s[tag=possible_to_draw,scores={disguise=0}] run particle minecraft:glow ~ ~4 ~ 0 0 0 0 1 normal @a[tag=can_see]

#Add if possible
execute as @s[scores={regenerated_strength=1..},tag=possible_to_draw] run scoreboard players add @s current_held 10

#Just limited elsewhere if in a circle

execute as @s[tag=possible_to_draw] if score Draw_force reg_1 matches 1.. run scoreboard players remove Draw_force reg_1 1
execute as @s[tag=possible_to_draw] if score Draw_force reg_1 matches 1.. run function magic:draw_ten