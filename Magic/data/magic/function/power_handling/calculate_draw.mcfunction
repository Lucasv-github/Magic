################################################################################
#Purpose: Calculate current_draw add based on eye count in Temp reg_1
#Arguments: @s reg_1: Eye count
#Runner: An entity whose current_draw should be drawn from
#Return values: @s reg_1: draw_add, @s reg_2: draw_blocked
#Authors: Lprogrammer
################################################################################

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

data remove storage magic:math/get_strength index

scoreboard players operation @s reg_1 *= Temp reg_1
scoreboard players operation @s reg_1 /= 100 reg_1

tag @s remove periodic_draw_block

#Shield handling
scoreboard players operation Temp reg_1 = @s entity_id
#This doesn't scratch player regs
function magic_commons:hooks/get_shielded_lower

#Calculate new cumulative halve amount hold that takes shield reduction into account
scoreboard players operation Temp reg_2 = @s cumulative_halve_amount_hold

scoreboard players operation Temp reg_3 = @s cumulative_halve_amount_hold
scoreboard players operation Temp reg_3 -= Temp reg_1


#Limit more draw if drawing less than shield limit
execute if score Temp reg_1 matches 1.. if score @s current_draw <= Temp reg_3 run scoreboard players operation Temp reg_2 -= Temp reg_1
execute if score Temp reg_1 matches 1.. if score @s current_draw <= Temp reg_3 run tag @s add periodic_draw_block

execute as @s[tag=circle_owner,tag=!angreal_flawed] run tag @s add periodic_draw_block
execute as @s[tag=angrealed,tag=!angreal_flawed] run tag @s add periodic_draw_block


#If we exceeded but are protected we return the maximum
execute as @s[tag=periodic_draw_block] if score @s reg_1 > Temp reg_2 run scoreboard players operation @s reg_1 = Temp reg_2

scoreboard players set @s reg_2 1
execute as @s[tag=periodic_draw_block] if score @s reg_1 = Temp reg_2 run return 0

scoreboard players set @s reg_2 0