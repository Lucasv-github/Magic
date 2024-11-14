execute at @s run playsound minecraft:entity.item.pickup player @s

scoreboard players operation Ray_data reg_1 = @s player_id

scoreboard players operation Ray_data reg_4 = @s current_held
scoreboard players operation Ray_data reg_4 /= 10 reg_1
scoreboard players set Ray_data reg_2 1
scoreboard players set Ray_data reg_3 0

#Bridge and throw will use the old snowball system
execute positioned ^ ^2 ^1 run function magic:ray_iteration