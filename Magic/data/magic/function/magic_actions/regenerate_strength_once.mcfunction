execute as @s run scoreboard players operation @s reg_1 = @s max_regenerated_strength 

#magic:power_handling/tap_power already does this so no reason to do this twice
#execute as @s run scoreboard players operation @s reg_1 *= @s angreal_level

scoreboard players operation @s reg_2 = @s reg_1
scoreboard players operation @s reg_1 /= 20 reg_1

execute if score @s regenerated_strength < @s reg_2 run scoreboard players operation @s regenerated_strength += @s reg_1
#Then limit in case of above
execute if score @s regenerated_strength > @s reg_2 run scoreboard players operation @s regenerated_strength = @s reg_2