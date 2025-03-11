execute at @s run summon chest_minecart ~ ~ ~ {CustomName:'{"text":"give_current_weave"}', Invulnerable:1b, Tags:["swap_hands_storage"], NoGravity:1b}

item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=swap_hands_storage] container.0 from entity @s weapon.mainhand

item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand from entity @e[type=minecraft:chest_minecart, limit=1, tag=swap_hands_storage] container.0

#Clear before kill
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=swap_hands_storage] container.0 with minecraft:air

kill @e[type=minecraft:chest_minecart, tag=swap_hands_storage]