#say tar store inventory

#Clear old
scoreboard players operation Temp reg_1 = @s player_id

#Spilling the items breaks some magic stuff
execute as @e[type=minecraft:chest_minecart,tag=tar_hotbar_storage] if score @s player_id = Temp reg_1 if score @s store_id = Temp reg_2 run data merge entity @s {Items:[]}
execute as @e[type=minecraft:chest_minecart,tag=tar_inventory_storage] if score @s player_id = Temp reg_1 if score @s store_id = Temp reg_2 run data merge entity @s {Items:[]}
execute as @e[type=minecraft:chest_minecart,tag=tar_echest_storage] if score @s player_id = Temp reg_1 if score @s store_id = Temp reg_2 run data merge entity @s {Items:[]}

execute as @e[type=minecraft:chest_minecart,tag=tar_hotbar_storage] if score @s player_id = Temp reg_1 if score @s store_id = Temp reg_2 run kill @s
execute as @e[type=minecraft:chest_minecart,tag=tar_inventory_storage] if score @s player_id = Temp reg_1 if score @s store_id = Temp reg_2 run kill @s
execute as @e[type=minecraft:chest_minecart,tag=tar_echest_storage] if score @s player_id = Temp reg_1 if score @s store_id = Temp reg_2 run kill @s

execute at @s run summon chest_minecart ~ ~ ~ {Invulnerable:1b, Tags:["current_storage","tar_hotbar_storage"], NoGravity:1}
execute at @s run summon chest_minecart ~ ~ ~ {Invulnerable:1b, Tags:["current_storage","tar_inventory_storage"], NoGravity:1}
execute at @s run summon chest_minecart ~ ~ ~ {Invulnerable:1b, Tags:["current_storage","tar_echest_storage"], NoGravity:1}

execute at @s run scoreboard players operation @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=tar_hotbar_storage] player_id = @s player_id
execute at @s run scoreboard players operation @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=tar_hotbar_storage] store_id = Temp reg_2
execute at @s in minecraft:overworld run tp @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=tar_hotbar_storage] 0 -80 0

execute at @s run scoreboard players operation @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=tar_inventory_storage] player_id = @s player_id
execute at @s run scoreboard players operation @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=tar_inventory_storage] store_id = Temp reg_2
execute at @s in minecraft:overworld run tp @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=tar_inventory_storage] 0 -80 0

execute at @s run scoreboard players operation @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=tar_echest_storage] player_id = @s player_id
execute at @s run scoreboard players operation @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=tar_echest_storage] store_id = Temp reg_2
execute at @s in minecraft:overworld run tp @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=tar_echest_storage] 0 -80 0

#Copy hotbar+hands+armor
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.0 from entity @s hotbar.0
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.1 from entity @s hotbar.1
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.2 from entity @s hotbar.2
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.3 from entity @s hotbar.3
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.4 from entity @s hotbar.4
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.5 from entity @s hotbar.5
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.6 from entity @s hotbar.6
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.7 from entity @s hotbar.7
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.8 from entity @s hotbar.8

item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.10 from entity @s weapon.offhand
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.11 from entity @s armor.head
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.12 from entity @s armor.chest
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.13 from entity @s armor.legs
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_hotbar_storage] container.14 from entity @s armor.feet

#Copy inventory
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.0 from entity @s inventory.0
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.1 from entity @s inventory.1
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.2 from entity @s inventory.2
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.3 from entity @s inventory.3
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.4 from entity @s inventory.4
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.5 from entity @s inventory.5
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.6 from entity @s inventory.6
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.7 from entity @s inventory.7
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.8 from entity @s inventory.8
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.9 from entity @s inventory.9
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.10 from entity @s inventory.10
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.11 from entity @s inventory.11
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.12 from entity @s inventory.12
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.13 from entity @s inventory.13
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.14 from entity @s inventory.14
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.15 from entity @s inventory.15
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.16 from entity @s inventory.16
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.17 from entity @s inventory.17
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.18 from entity @s inventory.18
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.19 from entity @s inventory.19
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.20 from entity @s inventory.20
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.21 from entity @s inventory.21
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.22 from entity @s inventory.22
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.23 from entity @s inventory.23
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.24 from entity @s inventory.24
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.25 from entity @s inventory.25
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_inventory_storage] container.26 from entity @s inventory.26


#Copy echest
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.0 from entity @s enderchest.0
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.1 from entity @s enderchest.1
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.2 from entity @s enderchest.2
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.3 from entity @s enderchest.3
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.4 from entity @s enderchest.4
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.5 from entity @s enderchest.5
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.6 from entity @s enderchest.6
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.7 from entity @s enderchest.7
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.8 from entity @s enderchest.8
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.9 from entity @s enderchest.9
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.10 from entity @s enderchest.10
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.11 from entity @s enderchest.11
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.12 from entity @s enderchest.12
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.13 from entity @s enderchest.13
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.14 from entity @s enderchest.14
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.15 from entity @s enderchest.15
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.16 from entity @s enderchest.16
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.17 from entity @s enderchest.17
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.18 from entity @s enderchest.18
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.19 from entity @s enderchest.19
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.20 from entity @s enderchest.20
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.21 from entity @s enderchest.21
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.22 from entity @s enderchest.22
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.23 from entity @s enderchest.23
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.24 from entity @s enderchest.24
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.25 from entity @s enderchest.25
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage,tag=tar_echest_storage] container.26 from entity @s enderchest.26


tag @e[type=minecraft:chest_minecart,tag=tar_hotbar_storage, tag=current_storage] remove current_storage

tag @e[type=minecraft:chest_minecart,tag=tar_inventory_storage, tag=current_storage] remove current_storage

tag @e[type=minecraft:chest_minecart,tag=tar_echest_storage, tag=current_storage] remove current_storage
