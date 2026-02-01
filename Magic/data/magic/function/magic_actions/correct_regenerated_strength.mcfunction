################################################################################
#Purpose: Refill the strength of a player correctly after they have been offline for a while
#Runner: The player whose strength should be refilled, via events/join.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation @s reg_1 = Temp total_ticks
scoreboard players operation @s reg_1 -= @s total_ticks

#To seconds
scoreboard players operation @s reg_1 /= 20 reg_1

#To minutes
scoreboard players operation @s reg_1 /= 60 reg_1

#tellraw @a {"score":{"name":"@s","objective":"reg_1"},"color":"dark_red"}

scoreboard players operation Correct_regenerate_strength reg_1 = @s reg_1

#This is above as it doesn't tough the Correct_regenerate_strength reg_1
execute if score Correct_regenerate_strength reg_1 matches 20.. run function magic:magic_actions/set_max_regenerated_strength

execute if score Correct_regenerate_strength reg_1 matches 1..19 run function magic:magic_actions/correct_regenerated_strength_iteration