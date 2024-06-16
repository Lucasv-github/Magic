tellraw @s ["","\n","\n","\n"]

tag @s remove magic_help_interactive_tutorial_wait_drop
tag @s add magic_help_interactive_tutorial_wait_kill

execute at @s run tp @s ~ ~5 ~
execute at @s run fill ~ ~-1 ~ ~ ~-10 ~ minecraft:dirt replace
execute at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:dirt replace

execute at @s run summon zombie ~ ~ ~10 {Tags:["magic_help_interactive_tutorial_enemy"],HandItems:[{id:diamond_sword,count:1},{id:shield,count:1}],HandDropChances:[0f,0f],ArmorItems:[{id:diamond_boots,count:1},{id:diamond_leggings,count:1},{id:diamond_chestplate,count:1},{id:diamond_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],active_effects:[{id:glowing,duration:1000000,amplifier:1,show_particles:0b}]}

execute at @s run summon zombie ~10 ~ ~ {Tags:["magic_help_interactive_tutorial_enemy"],HandItems:[{id:diamond_sword,count:1},{id:shield,count:1}],HandDropChances:[0f,0f],ArmorItems:[{id:diamond_boots,count:1},{id:diamond_leggings,count:1},{id:diamond_chestplate,count:1},{id:diamond_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],active_effects:[{id:glowing,duration:1000000,amplifier:1,show_particles:0b}]}

execute at @s run summon zombie ~-10 ~ ~ {Tags:["magic_help_interactive_tutorial_enemy"],HandItems:[{id:diamond_sword,count:1},{id:shield,count:1}],HandDropChances:[0f,0f],ArmorItems:[{id:diamond_boots,count:1},{id:diamond_leggings,count:1},{id:diamond_chestplate,count:1},{id:diamond_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],active_effects:[{id:glowing,duration:1000000,amplifier:1,show_particles:0b}]}

execute at @s run summon zombie ~ ~ ~-10 {Tags:["magic_help_interactive_tutorial_enemy"],HandItems:[{id:diamond_sword,count:1},{id:shield,count:1}],HandDropChances:[0f,0f],ArmorItems:[{id:diamond_boots,count:1},{id:diamond_leggings,count:1},{id:diamond_chestplate,count:1},{id:diamond_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],active_effects:[{id:glowing,duration:1000000,amplifier:1,show_particles:0b}]}

tellraw @s ["",{"text":"I assume you are now eager to learn some spells","bold":true,"color":"gold"},"\n",{"text":"You might also have noticed the enemies around you","bold":true,"color":"gold"},"\n",{"text":"Luckily you can't die here","bold":true,"color":"gold"},"\n","\n",{"text":"One of the more effective ways to kill is the small explosion:","bold":true,"color":"gold"},"\n",{"text":"It is made by using the elements in this order:","bold":true,"color":"gold"},"\uE001\uE002\uE001","\n","\n",{"text":"Finally you click with your spell","bold":true,"color":"dark_green"},"\n",{"text":"You will also notice that you won't need to drop the spells here after each use","bold":true,"color":"gold"}]