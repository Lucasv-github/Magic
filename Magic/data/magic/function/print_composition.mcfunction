function magic:get_composition

execute at @s[tag=inverted] run tellraw @a[tag=can_see,tag=truly_see] {"nbt":"text[]","storage":"minecraft:print_composition","interpret":true,"separator":""}

execute at @s[tag=!inverted] run tellraw @a[tag=can_see,tag=truly_see] {"nbt":"text[]","storage":"minecraft:print_composition","interpret":true,"separator":""}
