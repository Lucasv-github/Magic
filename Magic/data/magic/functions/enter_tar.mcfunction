function magic:tar_store_inventory

execute if dimension minecraft:overworld in minecraft:tar run tp @s ~ ~ ~
execute store result score @s reg_1 run data get entity @s Pos[0]
execute store result score @s reg_2 run data get entity @s Pos[2]

scoreboard players operation @s reg_1 /= 16 reg_1
scoreboard players operation @s reg_2 /= 16 reg_1
#This looks useless but removes the decimals
scoreboard players operation @s reg_1 *= 16 reg_1
scoreboard players operation @s reg_2 *= 16 reg_1

scoreboard players operation @s tar_current_chunk_x = @s reg_1
scoreboard players operation @s tar_current_chunk_y = @s reg_2

function magic:copy_chunks_tar

scoreboard players operation @s destination_x = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=target_point,distance=..3] destination_x
scoreboard players operation @s destination_y = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=target_point,distance=..3] destination_y
scoreboard players operation @s destination_z = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=target_point,distance=..3] destination_z

scoreboard players operation @s destination_x = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=gateway_end,distance=..3] destination_x
scoreboard players operation @s destination_y = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=gateway_end,distance=..3] destination_y
scoreboard players operation @s destination_z = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=gateway_end,distance=..3] destination_z

execute if dimension minecraft:overworld in magic:tar run function magic:teleport

#Makes things a bit easier + also harder
scoreboard players operation @s select_player = @s player_id

tag @s add in_tar