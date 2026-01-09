################################################################################
#Purpose: Increase the held power in an entity based on:
#Draw_amount = (cumulative_halve_amount_hold*(eyes*100/32))/100
#Then also tiredness scaling with the strength table
#
#Runner: An entity increasing their held power, via power_handling/periodic_draw_circle.mcfunction, power_handling/periodic_draw.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#Can't draw more even with one of these
execute as @s[tag=!welled] if score @s tap_block_percentage matches 1.. run return 0

#Eye count
scoreboard players operation @s reg_1 = Draw_force reg_1

#Correct for the bypass (we don't want it super fast after -2, 2)
#-3 = -1
#3 = 1
execute if score Draw_force reg_1 matches ..-0 run scoreboard players add @s reg_1 2
execute if score Draw_force reg_1 matches 0.. run scoreboard players remove @s reg_1 2

scoreboard players operation @s reg_1 *= 100 reg_1
scoreboard players operation @s reg_1 /= 32 reg_1

scoreboard players operation @s reg_1 *= @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 /= 100 reg_1

#Strength considerations
scoreboard players operation @s reg_2 = @s regenerated_strength
scoreboard players operation @s reg_2 *= 100 reg_1
scoreboard players operation @s reg_2 /= @s max_regenerated_strength

execute store result storage magic:math/get_strength index int 1 run scoreboard players get @s reg_2
function magic:math/get_strength with storage magic:math/get_strength

scoreboard players operation @s reg_1 *= Temp reg_1
scoreboard players operation @s reg_1 /= 100 reg_1

#Bypass to linear between -2 and 2
execute if score Draw_force reg_1 matches -2..2 run scoreboard players operation @s reg_1 = Draw_force reg_1
execute if score Draw_force reg_1 matches -2..2 run scoreboard players operation @s reg_1 *= 10 reg_1

scoreboard players operation @s current_held += @s reg_1

#Limit handling
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold

#This kind of capping shouldn't drain too fast as draining isn't computed from here
execute as @s[tag=circle_owner,tag=!angreal_flawed] if score @s current_held > @s reg_1 run scoreboard players operation @s current_held = @s cumulative_halve_amount_hold
execute as @s[tag=angrealed,tag=!angreal_flawed] if score @s current_held > @s reg_1 run scoreboard players operation @s current_held = @s cumulative_halve_amount_hold