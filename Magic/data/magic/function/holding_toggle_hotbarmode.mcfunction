execute at @s run summon chest_minecart ~ ~ ~ {CustomName:'{"text":"holding_toggle_hotbarmode_swap"}', Invulnerable:1b, Tags:["holding_toggle_hotbarmode_swap"], NoGravity:1}

item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=holding_toggle_hotbarmode_swap] container.0 from entity @s weapon.mainhand

item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand from entity @e[type=minecraft:chest_minecart, limit=1, tag=holding_toggle_hotbarmode_swap] container.0

#Clear before kill
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=holding_toggle_hotbarmode_swap] container.0 with minecraft:air

kill @e[type=minecraft:chest_minecart, tag=holding_toggle_hotbarmode_swap]

function magic:toggle_hotbarmode