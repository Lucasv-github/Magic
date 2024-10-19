scoreboard players operation @s cumulative_halve_amount_hold = @s max_halve_amount_hold
scoreboard players operation @s regenerated_strength /= @s angreal_level
scoreboard players operation @s current_held /= @s angreal_level
scoreboard players set @s angreal_level 1

tag @s remove angrealed
tag @s remove angrealed_held
tag @s remove angreal_flawed

execute at @s run playsound minecraft:block.anvil.place ambient @s