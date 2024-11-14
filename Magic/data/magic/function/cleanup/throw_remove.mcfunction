scoreboard players operation Temp reg_1 = @s player_weave_index
execute as @e[type=minecraft:snowball,tag=weave_thrower] if score @s player_weave_index = Temp reg_1 run tag @s add throw_remove_exists_temp

execute unless entity @e[tag=throw_remove_exists_temp] run function magic:weave_handling/remove_weave
execute unless entity @e[tag=throw_remove_exists_temp] run tag @s remove weave_throw_damaged

tag @e remove throw_remove_exists_temp
