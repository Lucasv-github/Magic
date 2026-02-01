scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
scoreboard players operation Temp reg_2 = @s weave_owner_player_id

#Preven if oponent is using
execute as @e[tag=!using] if score @s entity_id = Temp reg_1 run tag @s add drop_my_items

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 at @s run summon chest_minecart ~ ~ ~ {Invulnerable:1b, Tags:["weave_drop_1"], NoGravity:1}
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 at @s run summon chest_minecart ~ ~ ~ {Invulnerable:1b, Tags:["weave_drop_2"], NoGravity:1}

item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.0 from entity @e[tag=drop_my_items,limit=1] armor.chest
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.1 from entity @e[tag=drop_my_items,limit=1] armor.feet
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.2 from entity @e[tag=drop_my_items,limit=1] armor.head
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.3 from entity @e[tag=drop_my_items,limit=1] armor.legs

item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.4 from entity @e[tag=drop_my_items,limit=1] hotbar.0
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.5 from entity @e[tag=drop_my_items,limit=1] hotbar.1
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.6 from entity @e[tag=drop_my_items,limit=1] hotbar.2
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.7 from entity @e[tag=drop_my_items,limit=1] hotbar.3
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.8 from entity @e[tag=drop_my_items,limit=1] hotbar.4
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.9 from entity @e[tag=drop_my_items,limit=1] hotbar.5
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.10 from entity @e[tag=drop_my_items,limit=1] hotbar.6
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.11 from entity @e[tag=drop_my_items,limit=1] hotbar.7
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_1] container.12 from entity @e[tag=drop_my_items,limit=1] hotbar.8

item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.0 from entity @e[tag=drop_my_items,limit=1] inventory.0
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.1 from entity @e[tag=drop_my_items,limit=1] inventory.1
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.2 from entity @e[tag=drop_my_items,limit=1] inventory.2
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.3 from entity @e[tag=drop_my_items,limit=1] inventory.3
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.4 from entity @e[tag=drop_my_items,limit=1] inventory.4
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.5 from entity @e[tag=drop_my_items,limit=1] inventory.5
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.6 from entity @e[tag=drop_my_items,limit=1] inventory.6
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.7 from entity @e[tag=drop_my_items,limit=1] inventory.7
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.8 from entity @e[tag=drop_my_items,limit=1] inventory.8
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.9 from entity @e[tag=drop_my_items,limit=1] inventory.9
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.10 from entity @e[tag=drop_my_items,limit=1] inventory.10
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.11 from entity @e[tag=drop_my_items,limit=1] inventory.11
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.12 from entity @e[tag=drop_my_items,limit=1] inventory.12
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.13 from entity @e[tag=drop_my_items,limit=1] inventory.13
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.14 from entity @e[tag=drop_my_items,limit=1] inventory.14
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.15 from entity @e[tag=drop_my_items,limit=1] inventory.15
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.16 from entity @e[tag=drop_my_items,limit=1] inventory.16
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.17 from entity @e[tag=drop_my_items,limit=1] inventory.17
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.18 from entity @e[tag=drop_my_items,limit=1] inventory.18
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.19 from entity @e[tag=drop_my_items,limit=1] inventory.19
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.20 from entity @e[tag=drop_my_items,limit=1] inventory.20
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.21 from entity @e[tag=drop_my_items,limit=1] inventory.21
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.22 from entity @e[tag=drop_my_items,limit=1] inventory.22
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.23 from entity @e[tag=drop_my_items,limit=1] inventory.23
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.24 from entity @e[tag=drop_my_items,limit=1] inventory.24
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.25 from entity @e[tag=drop_my_items,limit=1] inventory.25
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop_2] container.26 from entity @e[tag=drop_my_items,limit=1] inventory.26

item replace entity @e[tag=drop_my_items,limit=1] armor.chest with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] armor.feet with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] armor.head with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] armor.legs with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] weapon.mainhand with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] weapon.offhand with minecraft:air

item replace entity @e[tag=drop_my_items,limit=1] hotbar.0 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] hotbar.1 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] hotbar.2 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] hotbar.3 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] hotbar.4 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] hotbar.5 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] hotbar.6 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] hotbar.7 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] hotbar.8 with minecraft:air

item replace entity @e[tag=drop_my_items,limit=1] inventory.0 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.1 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.2 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.3 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.4 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.5 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.6 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.7 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.8 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.9 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.10 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.11 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.12 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.13 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.14 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.15 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.16 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.17 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.18 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.19 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.20 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.21 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.22 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.23 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.24 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.25 with minecraft:air
item replace entity @e[tag=drop_my_items,limit=1] inventory.26 with minecraft:air


kill @e[type=minecraft:chest_minecart, tag=weave_drop_1]
kill @e[type=minecraft:chest_minecart, tag=weave_drop_2]

tag @e remove drop_my_items
tag @s add weave_damaged