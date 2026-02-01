#say drop tar inventory

scoreboard players operation Temp reg_1 = @s player_id

execute as @e[type=minecraft:chest_minecart,tag=tar_hotbar_storage] if score @s player_id = Temp reg_1 if score @s store_id = Temp reg_2 run tag @s add current_withdraw
execute as @e[type=minecraft:chest_minecart,tag=tar_inventory_storage] if score @s player_id = Temp reg_1 if score @s store_id = Temp reg_2 run tag @s add current_withdraw
execute as @e[type=minecraft:chest_minecart,tag=tar_echest_storage] if score @s player_id = Temp reg_1 if score @s store_id = Temp reg_2 run tag @s add current_withdraw

tp @e[type=chest_minecart, tag=current_withdraw] ~ ~ ~

#Drop items to player

kill @e[sort=nearest,type=minecraft:chest_minecart,tag=tar_hotbar_storage, tag=current_withdraw]
kill @e[sort=nearest,type=minecraft:chest_minecart,tag=tar_inventory_storage, tag=current_withdraw]
kill @e[sort=nearest,type=minecraft:chest_minecart,tag=tar_echest_storage, tag=current_withdraw]