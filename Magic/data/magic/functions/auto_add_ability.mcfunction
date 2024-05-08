tag @s add can_use
tag @s add can_see

#Get possible difference
scoreboard players operation @s reg_2 = magic_settings magic_max_strenght
scoreboard players operation @s reg_2 -= magic_settings magic_min_strenght

execute store result score @s reg_1 run random value 1..5000
execute store result storage get_normal_distributed_index index int 1 run scoreboard players get @s reg_1

function magic:get_normal_distributed with storage minecraft:get_normal_distributed_index

scoreboard players operation @s reg_2 *= @s reg_1

scoreboard players operation @s reg_2 /= 100 reg_1

scoreboard players operation @s reg_2 += magic_settings magic_min_strenght
scoreboard players operation @s halve_amount_hold = @s reg_2

#TODO scale these also
scoreboard players set @s max_regenerated_strenght 10000
scoreboard players set @s regenerated_strenght 10000