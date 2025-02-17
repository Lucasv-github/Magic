execute as @s[tag=using] run tag @s add exit_tar_using_temp
execute as @s[tag=using] run function magic:inventory/store_weaves
execute as @s[tag=using] run function magic:inventory/restore_regular

#Key to load
scoreboard players set Temp reg_2 0
function magic_commons:tar_load_inventory

execute as @s[tag=exit_tar_using_temp] run function magic:inventory/restore_magic
execute as @s[tag=exit_tar_using_temp] run function magic:inventory/load_weaves
tag @s remove exit_tar_using_temp

#Will also be ran if you have already exited as a cleanup
execute if dimension magic_commons:tar in minecraft:overworld run tp @s ~ ~ ~
scoreboard players operation Temp reg_1 = @s player_id
execute in minecraft:overworld positioned 0 -80 0 as @e[type=minecraft:armor_stand,distance=..1,tag=!gateway_blocked] if score @s player_id = Temp reg_1 run kill @s

scoreboard players operation @s destination_x = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=target_point,distance=..3] destination_x
scoreboard players operation @s destination_y = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=target_point,distance=..3] destination_y
scoreboard players operation @s destination_z = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=target_point,distance=..3] destination_z

scoreboard players operation @s destination_x = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=gateway_end,distance=..3] destination_x
scoreboard players operation @s destination_y = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=gateway_end,distance=..3] destination_y
scoreboard players operation @s destination_z = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=gateway_end,distance=..3] destination_z

execute if dimension magic_commons:tar in minecraft:overworld run function magic_commons:teleport

scoreboard players reset @s tar_survival
scoreboard players reset @s tar_creative

gamemode survival @s
tag @s remove in_tar