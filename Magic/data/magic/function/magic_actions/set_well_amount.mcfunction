#Slot in Temp reg_1
#Value in Temp reg_2

execute at @s run summon chest_minecart ~ ~ ~ {CustomName:{"text":"set_well_amount_storage"}, Invulnerable:1b, Tags:["set_well_amount_storage"], NoGravity:1}

#This could be done with a macro
execute if score Temp reg_1 matches 0 run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0 from entity @s hotbar.0
execute if score Temp reg_1 matches 1 run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0 from entity @s hotbar.1
execute if score Temp reg_1 matches 2 run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0 from entity @s hotbar.2
execute if score Temp reg_1 matches 3 run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0 from entity @s hotbar.3
execute if score Temp reg_1 matches 4 run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0 from entity @s hotbar.4
execute if score Temp reg_1 matches 5 run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0 from entity @s hotbar.5
execute if score Temp reg_1 matches 6 run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0 from entity @s hotbar.6
execute if score Temp reg_1 matches 7 run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0 from entity @s hotbar.7
execute if score Temp reg_1 matches 8 run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0 from entity @s hotbar.8

execute store result entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] Items[0].components.minecraft:custom_data.Well_current int 1 run scoreboard players get Temp reg_2

execute if score Temp reg_1 matches 0 run item replace entity @s hotbar.0 from entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0
execute if score Temp reg_1 matches 1 run item replace entity @s hotbar.1 from entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0
execute if score Temp reg_1 matches 2 run item replace entity @s hotbar.2 from entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0
execute if score Temp reg_1 matches 3 run item replace entity @s hotbar.3 from entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0
execute if score Temp reg_1 matches 4 run item replace entity @s hotbar.4 from entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0
execute if score Temp reg_1 matches 5 run item replace entity @s hotbar.5 from entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0
execute if score Temp reg_1 matches 6 run item replace entity @s hotbar.6 from entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0
execute if score Temp reg_1 matches 7 run item replace entity @s hotbar.7 from entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0
execute if score Temp reg_1 matches 8 run item replace entity @s hotbar.8 from entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0

#Clear before kill
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=set_well_amount_storage] container.0 with minecraft:air

kill @e[type=minecraft:chest_minecart, tag=set_well_amount_storage]
