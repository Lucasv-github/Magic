scoreboard players operation Temp reg_1 = @s player_id
execute as @e[type=minecraft:chest_minecart,name=hotbar_storage] if score @s player_id = Temp reg_1 run tag @s add current_withdraw

#Copy to player
item replace entity @s hotbar.0 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.0
item replace entity @s hotbar.1 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.1
item replace entity @s hotbar.2 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.2
item replace entity @s hotbar.3 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.3
item replace entity @s hotbar.4 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.4
item replace entity @s hotbar.5 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.5
item replace entity @s hotbar.6 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.6
item replace entity @s hotbar.7 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.7
item replace entity @s hotbar.8 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.8

#Remove storage
kill @e[sort=nearest,type=minecraft:chest_minecart,name=hotbar_storage, tag=current_withdraw]