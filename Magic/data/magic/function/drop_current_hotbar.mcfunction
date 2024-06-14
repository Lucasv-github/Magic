execute at @s run summon chest_minecart ~ ~ ~ {CustomName:'{"text":"hotbar_drop"}', Invulnerable:1b, Tags:["hotbar_drop"], NoGravity:1}

#Copy bar
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=hotbar_drop] container.0 from entity @s hotbar.0
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=hotbar_drop] container.1 from entity @s hotbar.1
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=hotbar_drop] container.2 from entity @s hotbar.2
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=hotbar_drop] container.3 from entity @s hotbar.3
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=hotbar_drop] container.4 from entity @s hotbar.4
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=hotbar_drop] container.5 from entity @s hotbar.5
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=hotbar_drop] container.6 from entity @s hotbar.6
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=hotbar_drop] container.7 from entity @s hotbar.7
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=hotbar_drop] container.8 from entity @s hotbar.8

#Prevent dupe
item replace entity @s hotbar.0 with minecraft:air
item replace entity @s hotbar.1 with minecraft:air
item replace entity @s hotbar.2 with minecraft:air
item replace entity @s hotbar.3 with minecraft:air
item replace entity @s hotbar.4 with minecraft:air
item replace entity @s hotbar.5 with minecraft:air
item replace entity @s hotbar.6 with minecraft:air
item replace entity @s hotbar.7 with minecraft:air
item replace entity @s hotbar.8 with minecraft:air

kill @e[type=minecraft:chest_minecart, tag=hotbar_drop]
