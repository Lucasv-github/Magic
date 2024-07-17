tellraw @s ["","\n","\n","\n"]

tellraw @s {"text":"That wasn't very hard?","bold":true,"color":"gold"}
tag @s remove magic_help_interactive_tutorial_wait_open
tag @s add magic_help_interactive_tutorial_keep_held
tag @s add magic_help_interactive_tutorial_wait_build

execute at @s run setblock ~1 ~ ~ minecraft:air
execute at @s run setblock ~-1 ~ ~ minecraft:air

execute at @s run setblock ~ ~ ~1 minecraft:air
execute at @s run setblock ~ ~ ~-1 minecraft:air

execute at @s run setblock ~1 ~1 ~ minecraft:air
execute at @s run setblock ~-1 ~1 ~ minecraft:air

execute at @s run setblock ~ ~1 ~1 minecraft:air
execute at @s run setblock ~ ~1 ~-1 minecraft:air

execute at @s run setblock ~ ~-1 ~ minecraft:air

execute at @s run setblock ~ ~2 ~ minecraft:air

item replace entity @s inventory.0 from entity @s hotbar.5

item replace entity @s hotbar.5 with minecraft:air

tellraw @s ["",{"text":"In your inventory you now have the 5 elements: ","bold":true,"color":"gold"},"\uE000\uE001\uE002\uE003\uE004","\n",{"text":"The elements are the ingredients of any spell","bold":true,"color":"gold"},"\n","\n",{"text":"They can be used in two ways:","bold":true,"color":"gold"},"\n","\n",{"text":"1 By dropping them","bold":true,"color":"dark_green"},"\n",{"text":"2 By right clicing them","bold":true,"color":"dark_green"},"\n","\n",{"text":"Use the method you like better","bold":true,"color":"gold"}]