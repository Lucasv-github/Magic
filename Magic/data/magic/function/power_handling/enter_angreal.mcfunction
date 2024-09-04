#tellraw @a {"score":{"name":"@s","objective":"reg_1"}}
scoreboard players operation @s cumulative_halve_amount_hold = @s halve_amount_hold
scoreboard players operation @s cumulative_halve_amount_hold *= @s reg_1
scoreboard players operation @s regenerated_strength *= @s reg_1
scoreboard players operation @s angreal_level = @s reg_1

tag @s add angrealed

execute at @s run playsound minecraft:block.anvil.place ambient @s