scoreboard players operation Temp reg_1 = @s weave_locked_player_id
scoreboard players operation Temp reg_2 = @s player_id

#Preven if oponent is using
execute as @a[tag=!using] if score @s player_id = Temp reg_1 run tag @s add drop_my_items

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 at @s run summon chest_minecart ~ ~ ~ {CustomName:'{"text":"weave_drop"}', Invulnerable:1b, Tags:["weave_drop"], NoGravity:1}

item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop] container.0 from entity @a[tag=drop_my_items,limit=1] armor.chest
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop] container.1 from entity @a[tag=drop_my_items,limit=1] armor.feet
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop] container.2 from entity @a[tag=drop_my_items,limit=1] armor.head
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop] container.3 from entity @a[tag=drop_my_items,limit=1] armor.legs
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop] container.4 from entity @a[tag=drop_my_items,limit=1] weapon.mainhand
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=weave_drop] container.5 from entity @a[tag=drop_my_items,limit=1] weapon.offhand

item replace entity @a[tag=drop_my_items,limit=1] armor.chest with minecraft:air
item replace entity @a[tag=drop_my_items,limit=1] armor.feet with minecraft:air
item replace entity @a[tag=drop_my_items,limit=1] armor.head with minecraft:air
item replace entity @a[tag=drop_my_items,limit=1] armor.legs with minecraft:air
item replace entity @a[tag=drop_my_items,limit=1] weapon.mainhand with minecraft:air
item replace entity @a[tag=drop_my_items,limit=1] weapon.offhand with minecraft:air

kill @e[type=minecraft:chest_minecart, tag=weave_drop]

tag @a remove drop_my_items
