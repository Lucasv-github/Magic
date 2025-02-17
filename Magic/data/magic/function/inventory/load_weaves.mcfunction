scoreboard players operation Temp reg_1 = @s player_id
execute as @e[type=minecraft:chest_minecart,tag=weave_hotbar_storage] if score @s player_id = Temp reg_1 run tag @s add current_withdraw

execute if items entity @e[type=minecraft:chest_minecart,tag=current_withdraw] container.0 * run item replace entity @s hotbar.0 from entity @e[type=minecraft:chest_minecart,tag=current_withdraw,limit=1] container.0
execute if items entity @e[type=minecraft:chest_minecart,tag=current_withdraw] container.1 * run item replace entity @s hotbar.1 from entity @e[type=minecraft:chest_minecart,tag=current_withdraw,limit=1] container.1
execute if items entity @e[type=minecraft:chest_minecart,tag=current_withdraw] container.2 * run item replace entity @s hotbar.2 from entity @e[type=minecraft:chest_minecart,tag=current_withdraw,limit=1] container.2
execute if items entity @e[type=minecraft:chest_minecart,tag=current_withdraw] container.3 * run item replace entity @s hotbar.3 from entity @e[type=minecraft:chest_minecart,tag=current_withdraw,limit=1] container.3
execute if items entity @e[type=minecraft:chest_minecart,tag=current_withdraw] container.4 * run item replace entity @s hotbar.4 from entity @e[type=minecraft:chest_minecart,tag=current_withdraw,limit=1] container.4
execute if items entity @e[type=minecraft:chest_minecart,tag=current_withdraw] container.5 * run item replace entity @s hotbar.5 from entity @e[type=minecraft:chest_minecart,tag=current_withdraw,limit=1] container.5
execute if items entity @e[type=minecraft:chest_minecart,tag=current_withdraw] container.6 * run item replace entity @s hotbar.6 from entity @e[type=minecraft:chest_minecart,tag=current_withdraw,limit=1] container.6
execute if items entity @e[type=minecraft:chest_minecart,tag=current_withdraw] container.7 * run item replace entity @s hotbar.7 from entity @e[type=minecraft:chest_minecart,tag=current_withdraw,limit=1] container.7
execute if items entity @e[type=minecraft:chest_minecart,tag=current_withdraw] container.8 * run item replace entity @s hotbar.8 from entity @e[type=minecraft:chest_minecart,tag=current_withdraw,limit=1] container.8

data modify entity @e[type=minecraft:chest_minecart,tag=weave_hotbar_storage, tag=current_withdraw,limit=1] Items set value []
kill @e[type=minecraft:chest_minecart,tag=weave_hotbar_storage, tag=current_withdraw]