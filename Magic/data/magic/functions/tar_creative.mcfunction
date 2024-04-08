scoreboard players operation Temp reg_1 = @s select_player
execute as @a if score @s player_id = Temp reg_1 run gamemode creative @s
scoreboard players set @s tar_creative 0