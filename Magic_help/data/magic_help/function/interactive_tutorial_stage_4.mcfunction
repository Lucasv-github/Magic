function magic_help:clear_chat
execute at @s run playsound minecraft:entity.arrow.hit_player

tag @s remove magic_help_interactive_tutorial_wait_drop
tag @s add magic_help_interactive_tutorial_wait_kill

execute at @s run tp @s ~ ~5 ~
execute at @s run fill ~ ~-1 ~ ~ ~-10 ~ minecraft:dirt replace
execute at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:dirt replace

execute at @s run summon zombie ~ ~ ~10 {Tags:["magic_help_interactive_tutorial_enemy"],active_effects:[{id:glowing,duration:1000000,show_particles:0b}],equipment:{head:{id:diamond_helmet},chest:{id:diamond_chestplate},legs:{id:diamond_leggings},feet:{id:diamond_boots}},drop_chances:{head:0f,chest:0f,legs:0f,feet:0f}}

execute at @s run summon zombie ~10 ~ ~ {Tags:["magic_help_interactive_tutorial_enemy"],active_effects:[{id:glowing,duration:1000000,show_particles:0b}],equipment:{head:{id:diamond_helmet},chest:{id:diamond_chestplate},legs:{id:diamond_leggings},feet:{id:diamond_boots}},drop_chances:{head:0f,chest:0f,legs:0f,feet:0f}}

execute at @s run summon zombie ~-10 ~ ~ {Tags:["magic_help_interactive_tutorial_enemy"],active_effects:[{id:glowing,duration:1000000,show_particles:0b}],equipment:{head:{id:diamond_helmet},chest:{id:diamond_chestplate},legs:{id:diamond_leggings},feet:{id:diamond_boots}},drop_chances:{head:0f,chest:0f,legs:0f,feet:0f}}

execute at @s run summon zombie ~ ~ ~-10 {Tags:["magic_help_interactive_tutorial_enemy"],active_effects:[{id:glowing,duration:1000000,show_particles:0b}],equipment:{head:{id:diamond_helmet},chest:{id:diamond_chestplate},legs:{id:diamond_leggings},feet:{id:diamond_boots}},drop_chances:{head:0f,chest:0f,legs:0f,feet:0f}}

tellraw @s ["",{"text":"I assume you are now eagered to learn some spells","bold":true,"color":"gold"},"\n",{"text":"You might also have noticed the enemies around you","bold":true,"color":"gold"},"\n",{"text":"Luckily you can't die here","bold":true,"color":"gold"},"\n","\n",{"text":"One of the more effective ways to kill is the small explosion:","bold":true,"color":"gold"},"\n",{"text":"It is made by using the elements in this order: ","bold":true,"color":"gold"},{text:"\uE001\uE002",font:"magic_resourcepack:elements"},"\n","\n",{"text":"Finally you click with your spell","bold":true,"color":"dark_green"},"\n",{"text":"You will also notice that you won't need to drop the spells here after each use","bold":true,"color":"gold"}]