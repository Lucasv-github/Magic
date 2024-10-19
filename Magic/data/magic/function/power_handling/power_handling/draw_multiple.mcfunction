#First factor in tiredness
scoreboard players operation @s reg_1 = @s regenerated_strength

#Try to reduce low strength effects a bit
scoreboard players operation @s reg_1 *= 2 reg_1
execute if score @s reg_1 > @s regenerated_strength run scoreboard players operation @s reg_1 = @s regenerated_strength

#Doing this z=(x/(y/100)) instead of z=(x*100/y) to try to prevent hitting int limit
scoreboard players operation @s reg_2 = @s max_regenerated_strength
scoreboard players operation @s reg_2 /= 100 reg_1

scoreboard players operation @s reg_1 /= @s reg_2

scoreboard players operation Draw_force reg_1 *= @s reg_1
scoreboard players operation Draw_force reg_1 /= 100 reg_1

#tellraw @p {"score":{"name":"Draw_force","objective":"reg_1"}}

execute if score Draw_force reg_1 matches 0 run scoreboard players set Draw_force reg_1 1

scoreboard players operation Draw_force reg_1 *= 10 reg_1

scoreboard players operation @s current_held += Draw_force reg_1

#Limit handling
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold

#This kind of capping shouldn't drain too fast as draining isn't computed from here
execute as @s[tag=circle_owner,tag=!angreal_flawed] if score @s current_held > @s reg_1 run scoreboard players operation @s current_held = @s cumulative_halve_amount_hold
execute as @s[tag=angrealed,tag=!angreal_flawed] if score @s current_held > @s reg_1 run scoreboard players operation @s current_held = @s cumulative_halve_amount_hold