#say tar load inventory


scoreboard players operation Temp reg_1 = @s player_id
execute as @e[type=minecraft:chest_minecart,name=tar_hotbar_storage] if score @s player_id = Temp reg_1 run tag @s add current_withdraw
execute as @e[type=minecraft:chest_minecart,name=tar_inventory_storage] if score @s player_id = Temp reg_1 run tag @s add current_withdraw
execute as @e[type=minecraft:chest_minecart,name=tar_echest_storage] if score @s player_id = Temp reg_1 run tag @s add current_withdraw

#Copy hotbar+hands+armor
item replace entity @s hotbar.0 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.0
item replace entity @s hotbar.1 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.1
item replace entity @s hotbar.2 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.2
item replace entity @s hotbar.3 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.3
item replace entity @s hotbar.4 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.4
item replace entity @s hotbar.5 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.5
item replace entity @s hotbar.6 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.6
item replace entity @s hotbar.7 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.7
item replace entity @s hotbar.8 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.8

item replace entity @s weapon.offhand from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.10
item replace entity @s armor.head from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.11
item replace entity @s armor.chest from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.12
item replace entity @s armor.legs from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.13
item replace entity @s armor.feet from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_hotbar_storage] container.14

#Copy inventory
item replace entity @s inventory.0 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.0
item replace entity @s inventory.1 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.1
item replace entity @s inventory.2 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.2
item replace entity @s inventory.3 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.3
item replace entity @s inventory.4 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.4
item replace entity @s inventory.5 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.5
item replace entity @s inventory.6 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.6
item replace entity @s inventory.7 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.7
item replace entity @s inventory.8 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.8
item replace entity @s inventory.9 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.9
item replace entity @s inventory.10 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.10
item replace entity @s inventory.11 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.11
item replace entity @s inventory.12 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.12
item replace entity @s inventory.13 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.13
item replace entity @s inventory.14 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.14
item replace entity @s inventory.15 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.15
item replace entity @s inventory.16 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.16
item replace entity @s inventory.17 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.17
item replace entity @s inventory.18 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.18
item replace entity @s inventory.19 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.19
item replace entity @s inventory.20 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.20
item replace entity @s inventory.21 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.21
item replace entity @s inventory.22 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.22
item replace entity @s inventory.23 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.23
item replace entity @s inventory.24 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.24
item replace entity @s inventory.25 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.25
item replace entity @s inventory.26 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_inventory_storage] container.26


#Copy echest
item replace entity @s enderchest.0 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.0
item replace entity @s enderchest.1 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.1
item replace entity @s enderchest.2 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.2
item replace entity @s enderchest.3 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.3
item replace entity @s enderchest.4 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.4
item replace entity @s enderchest.5 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.5
item replace entity @s enderchest.6 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.6
item replace entity @s enderchest.7 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.7
item replace entity @s enderchest.8 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.8
item replace entity @s enderchest.9 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.9
item replace entity @s enderchest.10 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.10
item replace entity @s enderchest.11 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.11
item replace entity @s enderchest.12 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.12
item replace entity @s enderchest.13 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.13
item replace entity @s enderchest.14 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.14
item replace entity @s enderchest.15 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.15
item replace entity @s enderchest.16 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.16
item replace entity @s enderchest.17 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.17
item replace entity @s enderchest.18 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.18
item replace entity @s enderchest.19 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.19
item replace entity @s enderchest.20 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.20
item replace entity @s enderchest.21 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.21
item replace entity @s enderchest.22 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.22
item replace entity @s enderchest.23 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.23
item replace entity @s enderchest.24 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.24
item replace entity @s enderchest.25 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.25
item replace entity @s enderchest.26 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw,name=tar_echest_storage] container.26


execute as @e[type=minecraft:chest_minecart,name=tar_hotbar_storage, tag=current_withdraw] run data merge entity @s {Items:[]}
execute as @e[type=minecraft:chest_minecart,name=tar_inventory_storage, tag=current_withdraw] run data merge entity @s {Items:[]}
execute as @e[type=minecraft:chest_minecart,name=tar_echest_storage, tag=current_withdraw] run data merge entity @s {Items:[]}

kill @e[type=minecraft:chest_minecart,name=tar_hotbar_storage, tag=current_withdraw]
kill @e[type=minecraft:chest_minecart,name=tar_inventory_storage, tag=current_withdraw]
kill @e[type=minecraft:chest_minecart,name=tar_echest_storage, tag=current_withdraw]