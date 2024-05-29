execute as @a[tag=can_use] run scoreboard players operation @s reg_1 = @s max_regenerated_strength 
execute as @a[tag=can_use] run scoreboard players operation @s reg_1 *= @s angreal_level

#Preserve
execute as @a[tag=can_use] run scoreboard players operation @s reg_2 = @s reg_1

execute as @a[tag=can_use] run scoreboard players operation @s reg_1 /= 20 reg_1

execute as @a[tag=can_use] if score @s regenerated_strength < @s reg_2 run scoreboard players operation @s regenerated_strength += @s reg_1
#Then limit in case of above
execute as @a[tag=can_use] if score @s regenerated_strength > @s reg_2 run scoreboard players operation @s regenerated_strength = @s reg_2