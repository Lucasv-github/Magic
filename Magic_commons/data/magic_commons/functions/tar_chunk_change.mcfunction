execute store result score @s reg_1 run data get entity @s Pos[0]
execute store result score @s reg_2 run data get entity @s Pos[2]

scoreboard players operation @s reg_1 /= 16 reg_1
scoreboard players operation @s reg_2 /= 16 reg_1

scoreboard players set @s reg_3 0

execute unless score @s tar_current_chunk_x = @s reg_1 run scoreboard players set @s reg_3 1
execute unless score @s tar_current_chunk_y = @s reg_2 run scoreboard players set @s reg_3 1

execute unless score @s tar_current_chunk_x = @s reg_1 run scoreboard players operation @s tar_current_chunk_x = @s reg_1
execute unless score @s tar_current_chunk_y = @s reg_2 run scoreboard players operation @s tar_current_chunk_y = @s reg_2

scoreboard players operation @s reg_1 *= 16 reg_1
scoreboard players operation @s reg_2 *= 16 reg_1

execute as @s[scores={reg_3=1}] run function magic:copy_chunks_tar