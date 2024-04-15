scoreboard players set @s add_ability 0
scoreboard players enable @s[tag=admin] add_ability

scoreboard players operation Temp reg_1 = @s select_player
execute as @a if score @s player_id = Temp reg_1 run tag @s add can_see
execute as @a if score @s player_id = Temp reg_1 run tag @s add can_use

scoreboard players operation Temp reg_2 = @s set_halve_hold
scoreboard players operation Temp reg_3 = @s set_regenerated

execute as @a if score @s player_id = Temp reg_1 run scoreboard players operation @s halve_amount_hold = Temp reg_2
execute as @a if score @s player_id = Temp reg_1 run scoreboard players operation @s max_regenerated_strenght = Temp reg_3